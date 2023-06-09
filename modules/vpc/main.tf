# create vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = merge(
    var.tags,
    var.vpc_tags
  )   # we need to merge common tags and vpc tags
}
# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    var.igw_tags
  )
  }

# public subnets in 1a and 1b,public route table,routes and association between subnet and route table
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr) # count = 2
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    var.tags,
    var.public_subnet_tags,
    {"Name" = var.public_subnet_names[count.index]} # this is the unique name for each subnet
  ) 
  
}
# Public Route Table
resource "aws_route_table" "public" { # one route table for public subnets
  vpc_id = aws_vpc.main.id 
  tags = merge(
    var.tags,
    var.public_route_table_tags,
    {"Name" = var.public_route_table_name}
  )
  }   
# Adding routes to public route table
resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}
# associate route_table with public subnet. we have 1 route table that should be associated to 2 route tables
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

# private subnets in 1a and 1b,private route table,routes and association between subnet and route table
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr) # count = 2
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    var.tags,
    var.private_subnet_tags,
    {"Name" = var.private_subnet_names[count.index]} # this is the unique name for each subnet
  ) 
  
}
# Elastic ip
resource "aws_eip" "main" { 
}
# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.tags,
    var.NAT_tags
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main]
}
# Private Route Table
resource "aws_route_table" "private" { # one route table for private subnets
  vpc_id = aws_vpc.main.id 
  tags = merge(
    var.tags,
    var.private_route_table_tags,
    {"Name" = var.private_route_table_name}
  )
  }   
  # Adding routes to private route table
resource "aws_route" "private" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.main.id
}
# associate route_table with private subnet. we have 1 route table that should be associated to 2 route tables
resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}
# Database subnets in 1a and 1b,database route table,routes and association between subnet and route table
resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidr) # count = 2
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    var.tags,
    var.database_subnet_tags,
    {"Name" = var.database_subnet_names[count.index]} # this is the unique name for each subnet
  ) 
  
}

# Database Route Table
resource "aws_route_table" "database" { # one route table for database subnets
  vpc_id = aws_vpc.main.id 
  tags = merge(
    var.tags,
    var.database_route_table_tags,
    {"Name" = var.database_route_table_name}
  )
  }   
  # Adding routes to database route table
resource "aws_route" "database" {
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.main.id
}
# associate route_table with database subnet. we have 1 route table that should be associated to 2 route tables
resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidr)
  subnet_id      = element(aws_subnet.database[*].id, count.index)
  route_table_id = aws_route_table.database.id
}

# Database subnet groups
resource "aws_db_subnet_group" "database" {
  name       = lookup(var.tags,"Name")
  subnet_ids = aws_subnet.database[*].id

  tags = merge(
    var.tags,
    var.database_subnet_group_tags
  )  
  
}