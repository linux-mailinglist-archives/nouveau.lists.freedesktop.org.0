Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B76F6B70
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB46D10E3E4;
	Thu,  4 May 2023 12:31:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC6310E172
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 15:40:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ud5so5989109ejc.4
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QAN8OvixvoiDT7o5IWtavPbT8mYBrElhe51myrEe9Nc=;
 b=LgXko/E5L3o+b9v1tbVqi/Lei/9hvX/Lso6nufr5mo208vBnwWjMO6KjWehG4pNE8W
 tCC5V39NCd/9gklfnKb6fp7J+uuhAQg6bCli7hOn0mBS2m65DUGOK4Ao4OZa9ODhelBK
 6jtObLWRtPfXvOXDjD1KxC0uFIFePuYBChFhg6OqhZs4ZRLT/Og4KIed/2JBJXtrX88o
 ipNXcN4yOgUBBex49JWQChKofNl0KHfg4pvEMPVE97d8Eaxn4QrVHbzdStHdhSKfUQ4P
 TwlTTxRaODC6tEMh2sdb/wCMqUZgrQKPlXJxc09DcAhcQ7xJ6h+y29CnpkG4B4TW/O4P
 1x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAN8OvixvoiDT7o5IWtavPbT8mYBrElhe51myrEe9Nc=;
 b=e31XNd70pmjaxEPoOLVaQP36z1zt7peAEqbGPLGZMoTyZScyLu3HymSgv3Bp6ILC+5
 lSl+dl0harmxlooovM2hM5SDJMoNqjANzkPZSUXOesDQnHNEJmzifSgM+9ytoE3ZTAwN
 j/TPzLu6XkR0RJ2PSSnrsN6JhLa4F8eHpq8zjr4YW1sk5ouYRPuFkyXIQeOCAY0jWn6/
 NRA9oQKTe06j/tMUSP5HcApP6c8D96klkKWSm6TeAwy5fe43khD0ZfQKjC6wVGPftKAR
 RmPPkEsS/+t3VkS8S2ns+u3k3Zi1/Bll6c7sqXggJpu/pV+3VRgvOt1ASz2rJyRXP7ic
 Ox5w==
X-Gm-Message-State: ACrzQf2aae9O5EeJF/UxxzpTyMt729MJ2B1SGkQoB/ylJ2BjJ5DW9V1p
 mc57j0ujOJrgTsD/DCml5g==
X-Google-Smtp-Source: AMsMyM4Jn3kIu/KDmlULCa4omm5Qk7kvH++I4vVdvINX/VC2KlDALE786RPopoetnmaDB0MNkjolEg==
X-Received: by 2002:a17:907:162a:b0:7a9:9875:3147 with SMTP id
 hb42-20020a170907162a00b007a998753147mr60238876ejc.546.1668094813597; 
 Thu, 10 Nov 2022 07:40:13 -0800 (PST)
Received: from ?IPV6:2a02:2f01:740e:c00::2110? ([2a02:2f01:740e:c00::2110])
 by smtp.gmail.com with ESMTPSA id
 hp20-20020a1709073e1400b0078d3f96d293sm7425477ejc.30.2022.11.10.07.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 07:40:12 -0800 (PST)
Message-ID: <5f5f5a82-b8d0-4695-08f2-1770f60cc0f0@gmail.com>
Date: Thu, 10 Nov 2022 17:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Ajay Gupta <ajayg@nvidia.com>, Karol Herbst <kherbst@redhat.com>
References: <tk6dm1$jsm$1@ciao.gmane.io>
 <CACO55tt5QTM=Amm560pBoDyKdib+YL77-d3rArhi0AmtLOdPMg@mail.gmail.com>
 <DM4PR12MB57708357FD79CF2D7FF02298DC3E9@DM4PR12MB5770.namprd12.prod.outlook.com>
From: Timothy Madden <terminatorul@gmail.com>
In-Reply-To: <DM4PR12MB57708357FD79CF2D7FF02298DC3E9@DM4PR12MB5770.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:33 +0000
Subject: Re: [Nouveau] Fans ramping up randomly when idle
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 11/10/22 00:50, Ajay Gupta wrote:
>
>> On Sat, Nov 5, 2022 at 8:36 PM Timothy Madden <terminatorul@gmail.com>
>> wrote:
>>> Hello
>>>
>>> My Msi Gaming X Trio 2080 Ti randomly ramps up the fans with no way to
>>> recover (I have to reboot) even when the card is idle or is only showing the
>> desktop.
>>> This issue happens even when the card is not connected to a monitor.
>>>
>>> My dmesg output from nouveau is included below, I think the last 2
>>> lines are the relevant ones:
>>> [ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state
>>> from D3hot to D0, device inaccessible [ 9427.889387] nvidia-gpu
>>> 0000:0b:00.3: i2c timeout error ffffffff
> This only implies that there is no usb/ucsi device on the card, it is expected from
> such cards and should be seen in dmesg even when heating issue is not there.
>
>

More dmesg output from another session showing the same message from 
xhci_hcd,
plus a kernel trace occurs when trying to shut down the computer


Nov 10 14:39:58.800882 localhost kernel: thermal thermal_zone1: failed 
to read out thermal zone (-61)
Nov 10 14:39:58.804606 localhost kernel: input: HD-Audio Generic Front 
Mic as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/sound/card2/input22
Nov 10 14:39:58.804644 localhost kernel: input: HD-Audio Generic Rear 
Mic as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/sound/card2/input23
Nov 10 14:39:58.804662 localhost kernel: input: HD-Audio Generic Line as 
/devices/pci0000:00/0000:00:08.1/0000:0d:00.3/sound/card2/input24
Nov 10 14:39:58.804679 localhost kernel: input: HD-Audio Generic Line 
Out Front as 
/devices/pci0000:00/0000:00:08.1/0000:0d:00.3/sound/card2/input25
Nov 10 14:39:58.804695 localhost kernel: input: HD-Audio Generic Line 
Out Surround as 
/devices/pci0000:00/0000:00:08.1/0000:0d:00.3/sound/card2/input26
Nov 10 14:39:58.804712 localhost kernel: input: HD-Audio Generic Line 
Out CLFE as 
/devices/pci0000:00/0000:00:08.1/0000:0d:00.3/sound/card2/input27
Nov 10 14:39:58.804729 localhost kernel: input: HD-Audio Generic Front 
Headphone as 
/devices/pci0000:00/0000:00:08.1/0000:0d:00.3/sound/card2/input28
Nov 10 14:39:58.812600 localhost kernel: Bluetooth: hci0: Found device 
firmware: intel/ibt-18-16-1.sfi
Nov 10 14:39:58.812635 localhost kernel: Bluetooth: hci0: Boot Address: 
0x40800
Nov 10 14:39:58.812651 localhost kernel: Bluetooth: hci0: Firmware 
Version: 214-6.22
Nov 10 14:39:58.812665 localhost kernel: Bluetooth: hci0: Firmware 
already loaded
Nov 10 14:39:58.844599 localhost kernel: iwlwifi 0000:06:00.0: base HW 
address: d4:6d:6d:ad:12:bd, OTP minor version: 0x4
Nov 10 14:39:58.912599 localhost kernel: ieee80211 phy0: Selected rate 
control algorithm 'iwl-mvm-rs'
Nov 10 14:39:58.976599 localhost kernel: iwlwifi 0000:06:00.0 wlp6s0: 
renamed from wlan0
Nov 10 14:39:59.068610 localhost kernel: intel_rapl_common: Found RAPL 
domain package
Nov 10 14:39:59.068681 localhost kernel: intel_rapl_common: Found RAPL 
domain core
Nov 10 14:39:59.548603 localhost kernel: EXT4-fs (sda3): mounted 
filesystem with ordered data mode. Quota mode: none.
Nov 10 14:40:00.100765 localhost kernel: Bluetooth: BNEP (Ethernet 
Emulation) ver 1.3
Nov 10 14:40:00.100802 localhost kernel: Bluetooth: BNEP filters: 
protocol multicast
Nov 10 14:40:00.100817 localhost kernel: Bluetooth: BNEP socket layer 
initialized
Nov 10 14:40:00.100833 localhost kernel: Bluetooth: MGMT ver 1.22
Nov 10 14:40:00.100847 localhost kernel: NET: Registered PF_ALG protocol 
family
Nov 10 14:40:00.252604 localhost kernel: NET: Registered PF_QIPCRTR 
protocol family
Nov 10 14:40:00.392608 localhost kernel: bpfilter: Loaded bpfilter_umh 
pid 1434
Nov 10 14:40:00.392695 localhost unknown: Started bpfilter
Nov 10 14:40:00.692608 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692657 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692680 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692698 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692720 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692738 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692753 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.700598 localhost.localdomain kernel: amdgpu 
0000:0a:00.0: vgaarb: changed VGA decodes: 
olddecodes=io+mem,decodes=none:owns=io+mem
Nov 10 14:40:00.700757 localhost.localdomain kernel: nouveau 
0000:0b:00.0: vgaarb: changed VGA decodes: 
olddecodes=io+mem,decodes=none:owns=none
Nov 10 14:40:00.932605 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932660 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932688 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932709 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932729 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932767 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932790 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:01.036607 localhost.localdomain kernel: NET: Registered 
PF_PACKET protocol family
Nov 10 14:40:03.344601 localhost.localdomain kernel: igb 0000:07:00.0 
enp7s0: igb: enp7s0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: 
RX/TX
Nov 10 14:40:03.672602 localhost.localdomain kernel: IPv6: 
ADDRCONF(NETDEV_CHANGE): enp7s0: link becomes ready
Nov 10 14:40:07.783797 localhost.localdomain systemd-journald[759]: Time 
jumped backwards, rotating.
Nov 10 14:40:10.122652 localhost.localdomain kernel: Bluetooth: RFCOMM 
TTY layer initialized
Nov 10 14:40:10.122672 localhost.localdomain kernel: Bluetooth: RFCOMM 
socket layer initialized
Nov 10 14:40:10.122683 localhost.localdomain kernel: Bluetooth: RFCOMM 
ver 1.11
Nov 10 15:34:21.665521 localhost.localdomain kernel: nouveau 
0000:0b:00.0: therm: temperature (90 C) hit the 'fanboost' threshold
Nov 10 15:56:57.670622 localhost.localdomain kernel: nouveau 
0000:0b:00.0: therm: temperature (95 C) hit the 'downclock' threshold
Nov 10 14:39:58.812665 localhost kernel: Bluetooth: hci0: Firmware 
already loaded
Nov 10 14:39:58.844599 localhost kernel: iwlwifi 0000:06:00.0: base HW 
address: d4:6d:6d:ad:12:bd, OTP minor version: 0x4
Nov 10 14:39:58.912599 localhost kernel: ieee80211 phy0: Selected rate 
control algorithm 'iwl-mvm-rs'
Nov 10 14:39:58.976599 localhost kernel: iwlwifi 0000:06:00.0 wlp6s0: 
renamed from wlan0
Nov 10 14:39:59.068610 localhost kernel: intel_rapl_common: Found RAPL 
domain package
Nov 10 14:39:59.068681 localhost kernel: intel_rapl_common: Found RAPL 
domain core
Nov 10 14:39:59.548603 localhost kernel: EXT4-fs (sda3): mounted 
filesystem with ordered data mode. Quota mode: none.
Nov 10 14:40:00.100765 localhost kernel: Bluetooth: BNEP (Ethernet 
Emulation) ver 1.3
Nov 10 14:40:00.100802 localhost kernel: Bluetooth: BNEP filters: 
protocol multicast
Nov 10 14:40:00.100817 localhost kernel: Bluetooth: BNEP socket layer 
initialized
Nov 10 14:40:00.100833 localhost kernel: Bluetooth: MGMT ver 1.22
Nov 10 14:40:00.100847 localhost kernel: NET: Registered PF_ALG protocol 
family
Nov 10 14:40:00.252604 localhost kernel: NET: Registered PF_QIPCRTR 
protocol family
Nov 10 14:40:00.392608 localhost kernel: bpfilter: Loaded bpfilter_umh 
pid 1434
Nov 10 14:40:00.392695 localhost unknown: Started bpfilter
Nov 10 14:40:00.692608 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692657 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692680 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692698 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692720 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692738 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.692753 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.700598 localhost.localdomain kernel: amdgpu 
0000:0a:00.0: vgaarb: changed VGA decodes: 
olddecodes=io+mem,decodes=none:owns=io+mem
Nov 10 14:40:00.700757 localhost.localdomain kernel: nouveau 
0000:0b:00.0: vgaarb: changed VGA decodes: 
olddecodes=io+mem,decodes=none:owns=none
Nov 10 14:40:00.932605 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932660 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932688 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932709 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932729 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932767 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:00.932790 localhost.localdomain kernel: ACPI: \: failed to 
evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
Nov 10 14:40:01.036607 localhost.localdomain kernel: NET: Registered 
PF_PACKET protocol family
Nov 10 14:40:03.344601 localhost.localdomain kernel: igb 0000:07:00.0 
enp7s0: igb: enp7s0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: 
RX/TX
Nov 10 14:40:03.672602 localhost.localdomain kernel: IPv6: 
ADDRCONF(NETDEV_CHANGE): enp7s0: link becomes ready
Nov 10 14:40:07.783797 localhost.localdomain systemd-journald[759]: Time 
jumped backwards, rotating.
Nov 10 14:40:10.122652 localhost.localdomain kernel: Bluetooth: RFCOMM 
TTY layer initialized
Nov 10 14:40:10.122672 localhost.localdomain kernel: Bluetooth: RFCOMM 
socket layer initialized
Nov 10 14:40:10.122683 localhost.localdomain kernel: Bluetooth: RFCOMM 
ver 1.11
Nov 10 15:34:21.665521 localhost.localdomain kernel: nouveau 
0000:0b:00.0: therm: temperature (90 C) hit the 'fanboost' threshold
Nov 10 15:56:57.670622 localhost.localdomain kernel: nouveau 
0000:0b:00.0: therm: temperature (95 C) hit the 'downclock' threshold
Nov 10 16:00:02.318661 localhost.localdomain kernel: nvidia-gpu 
0000:0b:00.3: Unable to change power state from D3hot to D0, device 
inaccessible
Nov 10 16:00:02.378659 localhost.localdomain kernel: xhci_hcd 
0000:0b:00.2: Unable to change power state from D3hot to D0, device 
inaccessible
Nov 10 16:00:02.438659 localhost.localdomain kernel: xhci_hcd 
0000:0b:00.2: Unable to change power state from D3cold to D0, device 
inaccessible
Nov 10 16:00:02.438970 localhost.localdomain kernel: xhci_hcd 
0000:0b:00.2: Controller not ready at resume -19
Nov 10 16:00:02.439185 localhost.localdomain kernel: xhci_hcd 
0000:0b:00.2: PCI post-resume error -19!
Nov 10 16:00:02.439380 localhost.localdomain kernel: xhci_hcd 
0000:0b:00.2: HC died; cleaning up
Nov 10 16:00:03.438657 localhost.localdomain kernel: nvidia-gpu 
0000:0b:00.3: i2c timeout error ffffffff
Nov 10 16:00:03.438965 localhost.localdomain kernel: ucsi_ccg 28-0008: 
i2c_transfer failed -110
Nov 10 16:01:22.954678 localhost.localdomain kernel: show_signal_msg: 46 
callbacks suppressed
Nov 10 16:01:22.954803 localhost.localdomain kernel: kwalletd5[2791]: 
segfault at 557dd537c ip 00007f86b7476213 sp 00007ffca735cd70 error 4 in 
libqca-qt5.so.2.3.5[7f86b7466000+7a000]
Nov 10 16:01:22.954846 localhost.localdomain kernel: Code: 1f 84 00 00 
00 00 00 8b 47 10 85 c0 7e 69 53 80 3f 00 74 2b 48 8b 5f 18 48 85 db 74 
52 48 8b 7b 10 8b 53 0c 48 8b 33 48 8b 07 <ff> 50 08 48 89 df be 18 00 
00 00 5b e9 ac 01 ff ff 0f 1f 40 00 48
Nov 10 16:01:47.207199 localhost.localdomain kernel: nouveau 
0000:0b:00.0: timer: stalled at ffffffffffffffff
Nov 10 16:01:47.207632 localhost.localdomain kernel: ------------[ cut 
here ]------------
Nov 10 16:01:47.207861 localhost.localdomain kernel: nouveau 
0000:0b:00.0: timeout
Nov 10 16:01:47.207905 localhost.localdomain kernel: WARNING: CPU: 0 
PID: 1506 at drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.c:35 
g84_bar_flush+0xca/0xe0 [nouveau]
Nov 10 16:01:47.207941 localhost.localdomain kernel: Modules linked in: 
rfcomm nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet 
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct af_packet nft_chain_nat 
nf_tables ip6table_nat ip6table_mangle ip6table_raw ip6table_security 
iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 
iptable_mangle>
Nov 10 16:01:47.208040 localhost.localdomain kernel:  snd joydev 
soundcore ecdh_generic dca rfkill thermal gpio_amdpt gpio_generic 
tiny_power_button acpi_cpufreq fuse configfs ip_tables x_tables 
hid_generic usbhid uas usb_storage amdgpu crct10dif_pclmul crc32_pclmul 
nouveau polyval_clmulni polyval_generic gf128mul ghash_clmulni_intel 
video iommu_v2 drm_ttm_h>
Nov 10 16:01:47.208100 localhost.localdomain kernel: CPU: 0 PID: 1506 
Comm: Xorg.bin Not tainted 6.0.7-1-default #1 openSUSE Tumbleweed 
5e8b6dc6c4ea2058c3659c46d114e84bdc37a88e
Nov 10 16:01:47.208138 localhost.localdomain kernel: Hardware name: 
Gigabyte Technology Co., Ltd. X470 AORUS GAMING 5 WIFI/X470 AORUS GAMING 
5 WIFI-CF, BIOS F63c 07/20/2022
Nov 10 16:01:47.208167 localhost.localdomain kernel: RIP: 
0010:g84_bar_flush+0xca/0xe0 [nouveau]
Nov 10 16:01:47.208195 localhost.localdomain kernel: Code: 8b 40 10 48 
8b 78 10 48 8b 5f 50 48 85 db 75 03 48 8b 1f e8 88 9e e8 e0 48 89 da 48 
c7 c7 8e 7f aa c0 48 89 c6 e8 81 94 1b e1 <0f> 0b eb aa e8 8d a6 20 e1 
66 66 2e 0f 1f 84 00 00 00 00 00 66 90
Nov 10 16:01:47.208229 localhost.localdomain kernel: RSP: 
0018:ffffb5e4c0c338a8 EFLAGS: 00010086
Nov 10 16:01:47.208254 localhost.localdomain kernel: RAX: 
0000000000000000 RBX: ffff937b018f8850 RCX: 0000000000000027
Nov 10 16:01:47.208282 localhost.localdomain kernel: RDX: 
ffff937e3ea224e8 RSI: 0000000000000001 RDI: ffff937e3ea224e0
Nov 10 16:01:47.208310 localhost.localdomain kernel: RBP: 
ffff937b00f3b918 R08: 0000000000000000 R09: ffffb5e4c0c33750
Nov 10 16:01:47.208341 localhost.localdomain kernel: R10: 
0000000000000003 R11: ffff937e3e7fffe8 R12: 0000000000000246
Nov 10 16:01:47.208377 localhost.localdomain kernel: R13: 
0000000000000010 R14: 0000000000000004 R15: 0000000000000006
Nov 10 16:01:47.208414 localhost.localdomain kernel: FS: 
00007fee02b02940(0000) GS:ffff937e3ea00000(0000) knlGS:0000000000000000
Nov 10 16:01:47.208447 localhost.localdomain kernel: CS:  0010 DS: 0000 
ES: 0000 CR0: 0000000080050033
Nov 10 16:01:47.208474 localhost.localdomain kernel: CR2: 
000055c259db74c0 CR3: 0000000106ec6000 CR4: 00000000003506f0
Nov 10 16:01:47.208503 localhost.localdomain kernel: Call Trace:
Nov 10 16:01:47.208527 localhost.localdomain kernel:  <TASK>
Nov 10 16:01:47.208557 localhost.localdomain kernel: 
nv50_instobj_release+0x2a/0xa0 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208586 localhost.localdomain kernel: 
nvkm_vmm_iter.constprop.0+0x7e4/0x880 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208622 localhost.localdomain kernel:  ? 
nvkm_vmm_ptes_sparse+0x1e0/0x1e0 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208662 localhost.localdomain kernel:  ? 
gp100_vmm_pgt_sparse+0xc0/0xc0 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208700 localhost.localdomain kernel: 
nvkm_vmm_put_locked+0x105/0x280 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208733 localhost.localdomain kernel:  ? 
nvkm_vmm_ptes_sparse+0x1e0/0x1e0 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208756 localhost.localdomain kernel:  ? 
gp100_vmm_pgt_sparse+0xc0/0xc0 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208778 localhost.localdomain kernel: 
nvkm_uvmm_mthd+0x672/0x6a0 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208814 localhost.localdomain kernel:  ? 
btrfs_block_rsv_release+0x161/0x1c0 [btrfs 
99d03bf8982233f7af3195e0b6d760148166d664]
Nov 10 16:01:47.208844 localhost.localdomain kernel: 
nvkm_ioctl+0xd8/0x180 [nouveau 34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208868 localhost.localdomain kernel: 
nvif_object_mthd+0xc1/0x1f0 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.208896 localhost.localdomain kernel:  ? 
__count_memcg_events+0x2c/0x80
Nov 10 16:01:47.208923 localhost.localdomain kernel:  ? 
uncharge_batch+0xca/0x120
Nov 10 16:01:47.208951 localhost.localdomain kernel:  ? 
__slab_free+0xc4/0x2f0
Nov 10 16:01:47.208986 localhost.localdomain kernel: 
nvif_vmm_put+0x60/0x80 [nouveau 34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.209015 localhost.localdomain kernel: 
nouveau_vma_del+0x7c/0xb0 [nouveau 34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.209049 localhost.localdomain kernel: 
nouveau_gem_object_close+0x1cb/0x1e0 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.209072 localhost.localdomain kernel: 
drm_gem_handle_delete+0x69/0xd0
Nov 10 16:01:47.209098 localhost.localdomain kernel:  ? 
drm_mode_destroy_dumb+0x40/0x40
Nov 10 16:01:47.209504 localhost.localdomain kernel: 
drm_ioctl_kernel+0xc1/0x160
Nov 10 16:01:47.209531 localhost.localdomain kernel: drm_ioctl+0x21f/0x420
Nov 10 16:01:47.209558 localhost.localdomain kernel:  ? 
drm_mode_destroy_dumb+0x40/0x40
Nov 10 16:01:47.209590 localhost.localdomain kernel:  ? 
tlb_finish_mmu+0x65/0x170
Nov 10 16:01:47.209633 localhost.localdomain kernel:  ? 
__slab_free+0xc4/0x2f0
Nov 10 16:01:47.209669 localhost.localdomain kernel: 
nouveau_drm_ioctl+0x56/0xb0 [nouveau 
34ea2b686d636eb789a9af34726a5f23f567b847]
Nov 10 16:01:47.209696 localhost.localdomain kernel: 
__x64_sys_ioctl+0x90/0xd0
Nov 10 16:01:47.209724 localhost.localdomain kernel: do_syscall_64+0x5b/0x80
Nov 10 16:01:47.209750 localhost.localdomain kernel:  ? 
__vm_munmap+0x93/0x130
Nov 10 16:01:47.209773 localhost.localdomain kernel:  ? 
syscall_exit_to_user_mode+0x17/0x40
Nov 10 16:01:47.209795 localhost.localdomain kernel:  ? 
do_syscall_64+0x67/0x80
Nov 10 16:01:47.209818 localhost.localdomain kernel:  ? 
exc_page_fault+0x66/0x150
Nov 10 16:01:47.209844 localhost.localdomain kernel: 
entry_SYSCALL_64_after_hwframe+0x63/0xcd
Nov 10 16:01:47.209870 localhost.localdomain kernel: RIP: 
0033:0x7fee0301c9bf
Nov 10 16:01:47.209896 localhost.localdomain kernel: Code: 00 48 89 44 
24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 
24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 
48 8b 44 24 18 64 48 2b 04 25 28 00 00
Nov 10 16:01:47.209923 localhost.localdomain kernel: RSP: 
002b:00007ffe8c577e00 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Nov 10 16:01:47.209952 localhost.localdomain kernel: RAX: 
ffffffffffffffda RBX: 000055c25a6f8680 RCX: 00007fee0301c9bf
Nov 10 16:01:47.209971 localhost.localdomain kernel: RDX: 
00007ffe8c577e94 RSI: 00000000c00464b4 RDI: 0000000000000015
Nov 10 16:01:47.209992 localhost.localdomain kernel: RBP: 
00007ffe8c577e94 R08: 000055c25a6f83b0 R09: 00007fee03748840
Nov 10 16:01:47.210018 localhost.localdomain kernel: R10: 
00007fee02f21e90 R11: 0000000000000246 R12: 00000000c00464b4
Nov 10 16:01:47.210045 localhost.localdomain kernel: R13: 
0000000000000015 R14: 000055c25a024dc0 R15: 00007fee02722a60
Nov 10 16:01:47.210067 localhost.localdomain kernel: </TASK>
Nov 10 16:01:47.210093 localhost.localdomain kernel: ---[ end trace 
0000000000000000 ]---
Nov 10 16:01:47.210116 localhost.localdomain kernel: nouveau 
0000:0b:00.0: timer: stalled at ffffffffffffffff

