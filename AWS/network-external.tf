resource "aws_eip" "ip" {
  count = 1
  instance =  element(aws_instance.web.*.id, count.index)

  vpc      = true
}