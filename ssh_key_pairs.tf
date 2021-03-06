#CREANDO SSH KEYS
#Manera 1
resource "aws_key_pair" "key-class1" {
  key_name = "class_key1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKM+tT73H2l/AGQcEmHprnI48FFmiTgnmEd2SSpCPeJoe/97mq0WfZqZApm3nNKPhz4a9nadKKtO57EClFQ33QSWC7e0M1TF3WaettRVdaMb9lPivzFW5nbCnGACYq3ptrSy/X8oq0vwSaxB0sXvmRYVS6b9Eexu5zpcJMv5k21kvF8CCSZYXoVWiNzy/zHqE5SozkG+fTdz9DAaFlBCKGhikFDT4xLCGiQlJEo+GxDKxItVHHp1f/14SluVaDewCczr1M3g+sM/BHF6WEn2Bs2+sR0AM5i+4Ke4I3MKu9ewYNVXunrAZXzrX/6Imgk+W0K7AaNtiIrV10plsgVivgEZ2EoYvzgGxigxY8Egc3Wp3uX4o3APNVOeki+QXGO6KybBh4sM+0BLYx1x8W/vaCq9hqBteMLdfhlgCkmurvQGKJ79cZUCgTLgpkvTI1rqxCLk4KteKYwLYDzFGjdFOD/c0L49V3CJuf+upC/pakcfI9zKPjFSF+2cf9WlOXNlesHQZaojVWv9aKVgxzfPBSKQ3Kf0qEgJTPaaqH7bGmTGn7mI8a5JuBKOfYzLp5uTyftGUM1xGe+smwgtaztffi7qr6qhCYyNCgp+E/LC4VOo5Rp28bQnJw5tWRl7n3SNHj9C952d7YjYhv3mtuzUbn6R+IgcHkbeDvUrBxsDPXZQ=="
}
#Manera2
resource "aws_key_pair" "key-class2" {
  key_name = "class_key2"
  public_key = "${file("class_key.pem.pub")}"
}