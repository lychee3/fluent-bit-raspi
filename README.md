# fluent-bit-raspi

"fluent-bit on raspbian-stretch" docker container

## how to build

```
git clone https://github.com/lychee3/fluent-bit-raspi.git
cd fluent-bit-raspi
docker build -t lychee3/fluent-bit-raspi .
```

## running

```
docker run --rm -it lychee3/fluent-bit-raspi fluent-bit-raspi -i cpu -o stdout
```

or 

```
docker run --rm -it lychee3/fluent-bit-raspi fluent-bit-raspi -c /conf/fluent.conf
```