Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE27BCBA6
	for <lists+nouveau@lfdr.de>; Sun,  8 Oct 2023 03:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E984D10E076;
	Sun,  8 Oct 2023 01:48:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3782D10E076
 for <nouveau@lists.freedesktop.org>; Sun,  8 Oct 2023 01:48:38 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1qpIuK-0002Gz-7N
 for nouveau@lists.freedesktop.org; Sun, 08 Oct 2023 03:48:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Madden <terminatorul@gmail.com>
Date: Sun, 8 Oct 2023 04:48:28 +0300
Message-ID: <uft1pc$7mv$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Subject: [Nouveau] Error "kernel rejected pushbuf" for GA102 chipset OpenGL
 / Vulkan
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello

I have an RTX 3090 Strix card with GA102 chipset, and I get the below 
error whenever I try some GL / Vk benchmarks:

nouveau: kernel rejected pushbuf: No such device
nouveau: ch20: krec 0 pushes 1 bufs 7 relocs 0
nouveau: ch20: buf 00000000 00000014 00000004 00000004 00000000 
0x7f5dc2f80000 0xc800000 0x80000
nouveau: ch20: buf 00000001 00000008 00000002 00000002 00000000 (nil) 
0xce0000 0xd0000
nouveau: ch20: buf 00000002 0000000a 00000002 00000002 00000000 (nil) 
0xdb0000 0x20000
nouveau: ch20: buf 00000003 00000009 00000002 00000002 00000002 (nil) 
0xe00000 0xa600000
nouveau: ch20: buf 00000004 00000006 00000004 00000000 00000004 
0x7f5dd004d000 0x14000 0x1000
nouveau: ch20: buf 00000005 0000001b 00000002 00000002 00000000 (nil) 
0xce00000 0xa00000
nouveau: ch20: buf 00000006 00000019 00000004 00000000 00000004 
0x7f5d8533f000 0x28400000 0x9c4000
nouveau: ch20: psh 00000000 00000523e8 000005240c
nouveau:        0x20048100
nouveau:        0x00000000
nouveau:        0x0ce00000
nouveau:        0x00000000
nouveau:        0x28400000
nouveau:        0x20018106
nouveau:        0x009c4000
nouveau:        0x200180c0
nouveau:        0x00000186
luxmark.bin: ../nouveau/pushbuf.c:730: nouveau_pushbuf_data: Assertion 
`kref' failed.


I tried with a number of applications, Mesa versions and kernel 
versions, and I always get this error.

The error was not present with my old card RTX 2080 Ti (TU102 chipset, 
Mesa 23.0.0, Linux 6.2).

Apps that trigger the issue:
	- Unigine Valley 1.0 benchmark (OpenGL)
	- Unigine Heaven 4.0 (benchmark starts but errors out later)
	  (OpenGL)
	- LuxMark v3.1 with rusticl (on NVK experimental from git)

The issue is not triggered with:
	- glxgears
	- vkgears, vkcube
	- Unigine Tropics Demo 1.3 (OpenGL)
	- Unigine Valley, Unigine Heave running under wine (DX11)
	- FurMark 1.36 running under wine (OpenGL)

Tried with a number of kernels:
	- 6.4.4
	- 6.6.0-rc1
	- 6.6.0-rc4

Tried with Mesa versions:
	- 23.1.7
	- 23.2.0
	- 23.2.1
	- 23.3.0-devel (git main)

Sample dmesg output from 6.6.0-rc1 kernel:

[ 8696.671977] nouveau 0000:02:00.0: fifo: fault 00 [VIRT_READ] at 
000000004abc0000 engine 40 [gr] client 11 [GPC3/GCC] reason 02 [PTE] on 
channel 23 [05fe930000 valley_x64[11487]]
[ 8696.671987] nouveau 0000:02:00.0: 
fifo:c00000:0017:[valley_x64[11487]] rc scheduled
[ 8696.671990] nouveau 0000:02:00.0: fifo:c00000: rc scheduled
[ 8696.672019] nouveau 0000:02:00.0: 
fifo:c00000:0017:0017:[valley_x64[11487]] errored - disabling channel
[ 8696.672023] nouveau 0000:02:00.0: Xwayland[2603]: channel 23 killed!

	(https://gitlab.freedesktop.org/nouveau/mesa/uploads/8ea30740f8ce6c5e82a22c2dd6ccea7a/dmesg_output.txt)


Sample dmesg output from 6.6.0-rc4 kernel:
        https://pastebin.com/RPvSaiPX

Can you help me please ? I can not run most of my benchmarks because of 
this issue...

I do have a multi-GPU system with two additional GPUs (with no monitors):
	- Radeon Vega 8 iGPU (AMD Ryzen 7 5700G CPU)
	- Radeon RX 580 Pulse dGPU

Here is my inxi output:

timothy@localhost:~/packages/mesa> inxi -GSC -xx
System:
   Host: localhost.localdomain Kernel: 6.6.0-rc4-1.g019d4ec-default
     arch: x86_64 bits: 64 compiler: gcc v: 13.2.1 Desktop: KDE Plasma 
v: 5.27.8
     tk: Qt v: 5.15.10 wm: kwin_wayland dm: SDDM Distro: openSUSE Tumbleweed
     20231006
CPU:
   Info: 8-core model: AMD Ryzen 7 5700G with Radeon Graphics bits: 64
     type: MT MCP arch: Zen 3 rev: 0 cache: L1: 512 KiB L2: 4 MiB L3: 16 MiB
   Speed (MHz): avg: 888 high: 3011 min/max: 400/4673 cores: 1: 400 2: 3000
     3: 400 4: 400 5: 400 6: 400 7: 400 8: 400 9: 400 10: 400 11: 3011 
12: 400
     13: 400 14: 400 15: 400 16: 3000 bogomips: 121653
   Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm
Graphics:
   Device-1: AMD Ellesmere [Radeon RX 470/480/570/570X/580/580X/590]
     vendor: Sapphire driver: amdgpu v: kernel arch: GCN-4 pcie: speed: 
2.5 GT/s
     lanes: 8 ports: active: none empty: DP-5, DP-6, DVI-D-1, HDMI-A-3,
     HDMI-A-4 bus-ID: 01:00.0 chip-ID: 1002:67df temp: 34.0 C
   Device-2: NVIDIA GA102 [GeForce RTX 3090] vendor: ASUSTeK driver: nouveau
     v: kernel arch: Ampere pcie: speed: 8 GT/s lanes: 8 ports:
     active: DP-1,DP-4,DP-8 empty: DP-2, DP-3, DP-7, DP-9, HDMI-A-1, 
HDMI-A-2
     bus-ID: 02:00.0 chip-ID: 10de:2204
   Device-3: AMD Cezanne [Radeon Vega Series / Radeon Mobile Series]
     vendor: Gigabyte driver: amdgpu v: kernel arch: GCN-5 pcie: speed: 
8 GT/s
     lanes: 16 ports: active: none empty: HDMI-A-5 bus-ID: 0c:00.0
     chip-ID: 1002:1638 temp: 38.0 C
   Display: wayland server: X.org v: 1.21.1.8 with: Xwayland v: 23.2.1
     compositor: kwin_wayland driver: X: loaded: modesetting,nouveau
     unloaded: fbdev,vesa alternate: nv,nvidia dri: nouveau,radeonsi
     gpu: amdgpu,nouveau,amdgpu d-rect: 4720x3360 display-ID: 0
   Monitor-1: DP-1 pos: bottom-r res: 2560x1440 size: N/A
   Monitor-2: DP-4 pos: primary,top-left res: 1080x1920 size: N/A
   Monitor-3: DP-8 pos: top-center res: 1080x1920 size: N/A
   API: OpenGL v: 4.3 Mesa 23.2.1 renderer: NV172 direct-render: Yes
timothy@localhost:~/packages/mesa>

