function x = ebox1()
    global data_latch;
    data_latch = 128;
    global address_latch;
    address_latch = 64;

    rp2 = initrp2;
    clear_all_chars(rp2);
    clear_all_leds(rp2);
    blink_all_leds(rp2, 5);
    scroll_qmark(rp2);
    clear_all_chars(rp2);
    hello_world(rp2);
    
    invoke(rp2, 'Halt');
    release(rp2);
return


function rp2 = initrp2()
    rp2 = actxcontrol('rpco.x', [1 1 1 1]);
    if(invoke(rp2, 'ConnectRP2', 'GB', 1) == 0)
        if(invoke(rp2, 'ConnectRP2', 'USB', 1) == 0)
            er = 'Unable to Connect to RP2'
        else
            msg = 'Connected to RP2 via USB'
        end
    else
        msg = 'Connected to RP2 via Gigabit'
    end
    if(invoke(rp2, 'LoadCOF', 'ebox1.rcx') == 0)
        er = 'Error loading rco file'
    end
    invoke(rp2, 'Run');
return


function send_bit_pattern(device, bits)
    if (invoke(device, 'SetTagVal', 'BitPattern', bits) == 0)
        error('SetTagVal failed');
    end
    invoke(device, 'SoftTrg', 1);
return


function clear_all_chars(device)
    global data_latch;
    global address_latch;
    for i = 0:15
        bit_pattern = data_latch + 0; % 0 is null character (space)
        send_bit_pattern(device, bit_pattern);
        bit_pattern = address_latch + i; % clears the next character address       
        send_bit_pattern(device, bit_pattern);
    end
    x = 0;
return


function clear_all_leds(device)
    global address_latch;
    bit_pattern = address_latch + 32 + 16;
    send_bit_pattern(device, bit_pattern);
return


function set_all_leds(device)
    global address_latch;
    for i = 0:3
        bit_pattern = address_latch + 16 + (i * 4);
        send_bit_pattern(device, bit_pattern);
    end    
return


function blink_all_leds(device, times)
    for i = 1:times
        pause(0.2);
        set_all_leds(device);
        pause(0.2);
        clear_all_leds(device);
    end
return


function scroll_qmark(device)
    global data_latch;
    global address_latch;

    bit_pattern = data_latch + 31; % ?
    send_bit_pattern(device, bit_pattern);
    for i = 0:15
        bit_pattern = address_latch + i;
        send_bit_pattern(device, bit_pattern);
        pause(.1);
    end
return


function hello_world(device)
	global data_latch;
    global address_latch;
    
    bit_pattern = data_latch + 40; % H
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch; % position 0
    send_bit_pattern(device, bit_pattern);
    bit_pattern = data_latch + 37; % E
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch + 1; % position 1
    send_bit_pattern(device, bit_pattern);
    bit_pattern = data_latch + 44; % L
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch + 2; % position 2
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch + 3; % position 3
    send_bit_pattern(device, bit_pattern);
    bit_pattern = data_latch + 47; % O
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch + 4; % position 4
	send_bit_pattern(device, bit_pattern);

    bit_pattern = data_latch + 55; % W
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch + 8; % position 8
    send_bit_pattern(device, bit_pattern);
    bit_pattern = data_latch + 47; % O
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch + 9; % position 9
    send_bit_pattern(device, bit_pattern);
    bit_pattern = data_latch + 50; % R
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch + 10; % position 10
    send_bit_pattern(device, bit_pattern);
    bit_pattern = data_latch + 44; % L
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch + 11; % position 11
    send_bit_pattern(device, bit_pattern);
    bit_pattern = data_latch + 36; % D
    send_bit_pattern(device, bit_pattern);
    bit_pattern = address_latch + 12; % position 12
    send_bit_pattern(device, bit_pattern);
return
    


