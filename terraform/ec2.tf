resource "aws_key_pair" "wp-key" {
  key_name = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "wp-ec2" {
    ami = "ami-0de53d8956e8dcf80" # 好きなAMIを選択
    instance_type = "t2.micro"
    key_name = "${var.key_name}"
    subnet_id = "${aws_subnet.public.id}"

    # Our Security group to allow HTTP and SSH access
    vpc_security_group_ids = ["${aws_security_group.sg.id}"]
}
