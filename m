Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3F22C5DC4
	for <lists+nouveau@lfdr.de>; Thu, 26 Nov 2020 23:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A966EAD0;
	Thu, 26 Nov 2020 22:22:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB6A6EAD0
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 22:21:58 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id u18so4438021lfd.9
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 14:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JBkIU6q/NqKkW2YnDEx0CR8dNOUt83aSwV2wSyeLgho=;
 b=YePq8BMLGqpOkMhjMB66e4HeFFnF7ZVSaw97T6Vi7VwzzHaHNGJUY8zSqBDdRGHoBY
 I2nKlt8FfN970gjywuVOUZQDXuxNcQdK04PJPtpRcVs4OlttiO3gOunuJ63m8MpQq2k4
 7RyhWD5ievixW6nR8QhhHSROiB8koG9IRcK4qIVpME5EhHGPwtS0q9DlTfablIxDXQcX
 uoSVg+ngU7lVxIlNIOfHMLgm4C51SJ17WlLwwjzN4gJQ+X+zGknHzV36E6qAPd/totcu
 WNV2DkBzkikG1M6EvjHbBzZavSzaQWcPkuSHwRzcHOBrqR1Klxpq8vfCjrHpbenur+W7
 WOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JBkIU6q/NqKkW2YnDEx0CR8dNOUt83aSwV2wSyeLgho=;
 b=QoL9JlgQSK9IhmCC07sNn77ErsF3A8xyux8ybGAjwQXTWMEB/4poUFT+3KkQsH/Zuo
 cBEumySvH0uxpOd6x4JY9FyiboYijHaUYzl/VGTu0Hdhr1HktbLVKFpp+fLAJDbd88SR
 L6PtKQ32PAVDgovYoAOnDAxcdkN9Lelj7ZShPrz/j8zAXd2NDaQ/RNSHdgyo/42RxhYv
 F0PSL1Hcc+9q/H+uAhQMjc8tq26BqMR8QaBTtYAf/VtRTnpxkGN6yqfpeRXfkUelxpIk
 CvP5vadVinSCu8wqrOH8EEeWZbcz3yCGq6nNgQNuOZd0chYK4qrFdFKP2xwGgfjvUShC
 d0ow==
X-Gm-Message-State: AOAM530XWuqfVbdoRkHKs4jGG/OXtJyd9XvomWycI9upMzG3uRQsq21d
 LmLSIxyxXohP3vPuQ/1YvR19VN4229m4tOdQ5LnQssrmOhzyBw==
X-Google-Smtp-Source: ABdhPJwG48/AW7q0x9zxi0sP0MjboZx+qpCElutCrhwh9OrpSKMJ5tF6Ib82giDY2LnOPpZCZ0bSY4H1oYkIXUqJ0qA=
X-Received: by 2002:ac2:5087:: with SMTP id f7mr2249102lfm.369.1606429316754; 
 Thu, 26 Nov 2020 14:21:56 -0800 (PST)
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Thu, 26 Nov 2020 23:21:21 +0100
Message-ID: <CA+1FSihMFopo16wwa5kcXya6Qm=PH=QgZANFFTUD2cagytFhcQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [Nouveau] nouveau pmu: firmware unavailable error while passing
 through RTX 2080 ti to arch linux guest OS
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
Content-Type: multipart/mixed; boundary="===============1746576586=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1746576586==
Content-Type: multipart/alternative; boundary="000000000000c832c305b509f8eb"

--000000000000c832c305b509f8eb
Content-Type: text/plain; charset="UTF-8"

Hello to everyone.

I'm trying to make the nouveau driver work on my arch linux under ESXI 7.
I've followed all the instructions located on the sites below :


https://wiki.archlinux.org/index.php/nouveau


this is what I did :


nano /etc/default/grub

GRUB_CMDLINE_LINUX=""


nano /usr/lib/modprobe.d/nvidia.conf

#blacklist nouveau

blacklist nvidia

blacklist nvidia-gpu


nano /etc/mkinitcpio.conf

MODULES=(nouveau vmw_pvscsi vmw_vmci ata_piix)


mkinitcpio -P ALL and rebooted


this is how the nouveau driver handles my RTX 2080 ti :


[    0.661817] fbcon: Taking over console
[    0.661852] Console: switching to colour frame buffer device 128x48
[    0.670423] Linux agpgart interface v0.103
[    0.702390] ACPI Warning: \_SB.PCI0.PE50.S1F0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20200717/nsarguments-59)
[    0.702471] nouveau 0000:0b:00.0: enabling device (0000 -> 0003)
[    0.703449] checking generic (e8000000 300000) vs hw (fb000000 1000000)
[    0.703449] checking generic (e8000000 300000) vs hw (c0000000 10000000)
[    0.703450] checking generic (e8000000 300000) vs hw (d0000000 2000000)
[    0.703823] nouveau 0000:0b:00.0: NVIDIA TU102 (162000a1)
[    0.787386] nouveau 0000:0b:00.0: bios: version 90.02.17.00.71
[    0.787671] nouveau 0000:0b:00.0: pmu: firmware unavailable
[    0.788358] nouveau 0000:0b:00.0: bus: MMIO write of 00000000 FAULT at
009410 [ TIMEOUT ]
[    0.788389] nouveau 0000:0b:00.0: fb: 11264 MiB GDDR6
[    0.795940] nouveau 0000:0b:00.0: fifo: fault 01 [VIRT_WRITE] at
00000000000bd000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 0d
[REGION_VIOLATION] on channel -1 [02bfedf000 unknown]
[    0.879293] nouveau 0000:0b:00.0: fifo: fault 00 [VIRT_READ] at
00000000000bd000 engine c0 [BAR2] client 07 [HUB/HOST_CPU] reason 0d
[REGION_VIOLATION] on channel -1 [02bfedf000 unknown]
[    0.944029] BUG: unable to handle page fault for address:
ffffb0a4c0d00000
[    0.944088] #PF: supervisor read access in kernel mode
[    0.944118] #PF: error_code(0x0000) - not-present page
[    0.944148] PGD 42e000067 P4D 42e000067 PUD 42e195067 PMD 429098067 PTE 0
[    0.944182] Oops: 0000 [#1] PREEMPT SMP NOPTI
[    0.944212] CPU: 2 PID: 291 Comm: modprobe Not tainted 5.9.8-arch1-1 #1
[    0.944244] Hardware name: VMware, Inc. VMware7,1/440BX Desktop
Reference Platform, BIOS VMW71.00V.15401161.B64.2001021853 01/02/2020
[    0.944307] RIP: 0010:ioread32+0x27/0x60
[    0.944337] Code: 00 00 90 48 81 ff ff ff 03 00 77 1e 48 81 ff 00 00 01
00 76 05 0f b7 d7 ed c3 8b 15 8b 2c 42 01 b8 ff ff ff ff 85 d2 75 04 c3
<8b> 07 c3 83 ea 01 48 83 ec 08 48 89 fe 48 c7 c7 a8 c3 18 88 89 15
[    0.944407] RSP: 0018:ffffb0a4c0b4b600 EFLAGS: 00010292
[    0.944439] RAX: ffffffffc0363dc0 RBX: ffffa12f6a399800 RCX:
0000000000000000
[    0.944472] RDX: 00000000bad0acfe RSI: ffffb0a4c0d00000 RDI:
ffffb0a4c0d00000
[    0.944505] RBP: ffffb0a4c0b4b63c R08: ffffa12f6906bf80 R09:
000000000000d300
[    0.944537] R10: 0000000000000000 R11: ffffb0a4c0000000 R12:
ffffb0a4c0b4b738
[    0.944570] R13: ffffa12f6a399850 R14: ffffb0a4c0b4b648 R15:
0000000000000000
[    0.944604] FS:  00007fc80fdc5740(0000) GS:ffffa12f6fc80000(0000)
knlGS:0000000000000000
[    0.944639] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.944670] CR2: ffffb0a4c0d00000 CR3: 00000004296ac003 CR4:
00000000003706e0
[    0.944715] Call Trace:
[    0.944766]  gp102_acr_wpr_patch+0xa8/0x190 [nouveau]
[    0.944817]  nvkm_acr_oneinit+0x337/0x580 [nouveau]
[    0.944865]  nvkm_subdev_init+0x53/0xd0 [nouveau]
[    0.944898]  ? ktime_get+0x38/0xa0
[    0.944952]  nvkm_device_init+0x10b/0x190 [nouveau]
[    0.945009]  nvkm_udevice_init+0x41/0x60 [nouveau]
[    0.945056]  nvkm_object_init+0x3e/0x100 [nouveau]
[    0.945102]  nvkm_ioctl_new+0x177/0x1f0 [nouveau]
[    0.945148]  ? nvkm_client_notify+0x30/0x30 [nouveau]
[    0.945204]  ? nvkm_udevice_rd08+0x20/0x20 [nouveau]
[    0.945251]  nvkm_ioctl+0xde/0x180 [nouveau]
[    0.945296]  nvif_object_ctor+0x11e/0x1c0 [nouveau]
[    0.945343]  nvif_device_ctor+0x1f/0x60 [nouveau]
[    0.945400]  nouveau_cli_init+0x1c3/0x480 [nouveau]
[    0.945458]  nouveau_drm_device_init+0x74/0x7a0 [nouveau]
[    0.945491]  ? pci_bus_read_config_word+0x49/0x70
[    0.945548]  nouveau_drm_probe+0x138/0x200 [nouveau]
[    0.945581]  ? _raw_spin_unlock_irqrestore+0x20/0x40
[    0.945613]  local_pci_probe+0x42/0x80
[    0.945644]  ? pci_match_device+0xd7/0x100
[    0.946142]  pci_device_probe+0xfa/0x1b0
[    0.946481]  really_probe+0x205/0x460
[    0.946811]  driver_probe_device+0xe1/0x150
[    0.947135]  device_driver_attach+0xa1/0xb0
[    0.947448]  __driver_attach+0x8a/0x150
[    0.947750]  ? device_driver_attach+0xb0/0xb0
[    0.948043]  ? device_driver_attach+0xb0/0xb0
[    0.948328]  bus_for_each_dev+0x89/0xd0
[    0.948609]  bus_add_driver+0x12b/0x1e0
[    0.948891]  driver_register+0x8b/0xe0
[    0.949167]  ? 0xffffffffc0552000
[    0.949439]  do_one_initcall+0x59/0x240
[    0.949709]  do_init_module+0x5c/0x260
[    0.949968]  load_module+0x21a7/0x2450
[    0.950217]  __do_sys_finit_module+0xbd/0x120
[    0.950466]  do_syscall_64+0x33/0x40
[    0.950709]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    0.950943] RIP: 0033:0x7fc80feecd5d
[    0.951172] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 70 0c 00 f7 d8 64 89 01 48
[    0.951658] RSP: 002b:00007ffde760d6b8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    0.951906] RAX: ffffffffffffffda RBX: 0000564274ad29f0 RCX:
00007fc80feecd5d
[    0.952154] RDX: 0000000000000000 RSI: 00005642735a4288 RDI:
0000000000000010
[    0.952403] RBP: 0000000000060000 R08: 0000000000000000 R09:
0000000000000000
[    0.952686] R10: 0000000000000010 R11: 0000000000000246 R12:
00005642735a4288
[    0.952925] R13: 0000000000000000 R14: 0000564274ad2a70 R15:
0000564274ad29f0
[    0.953161] Modules linked in: nouveau(+) mxm_wmi wmi i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops cec rc_core
drm agpgart
[    0.953658] CR2: ffffb0a4c0d00000
[    0.953904] ---[ end trace 0c45b197538c3e5e ]---
[    0.954152] RIP: 0010:ioread32+0x27/0x60
[    0.954445] Code: 00 00 90 48 81 ff ff ff 03 00 77 1e 48 81 ff 00 00 01
00 76 05 0f b7 d7 ed c3 8b 15 8b 2c 42 01 b8 ff ff ff ff 85 d2 75 04 c3
<8b> 07 c3 83 ea 01 48 83 ec 08 48 89 fe 48 c7 c7 a8 c3 18 88 89 15
[    0.954975] RSP: 0018:ffffb0a4c0b4b600 EFLAGS: 00010292
[    0.955246] RAX: ffffffffc0363dc0 RBX: ffffa12f6a399800 RCX:
0000000000000000
[    0.955522] RDX: 00000000bad0acfe RSI: ffffb0a4c0d00000 RDI:
ffffb0a4c0d00000
[    0.955800] RBP: ffffb0a4c0b4b63c R08: ffffa12f6906bf80 R09:
000000000000d300
[    0.956079] R10: 0000000000000000 R11: ffffb0a4c0000000 R12:
ffffb0a4c0b4b738
[    0.956360] R13: ffffa12f6a399850 R14: ffffb0a4c0b4b648 R15:
0000000000000000
[    0.956788] FS:  00007fc80fdc5740(0000) GS:ffffa12f6fc80000(0000)
knlGS:0000000000000000
[    0.958042] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.958356] CR2: ffffb0a4c0d00000 CR3: 00000004296ac003 CR4:
00000000003706e0

have I skipped some relevant step ? Let me know,thanks.
-- 
Mario.

--000000000000c832c305b509f8eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<div class=3D"gmail-_1blFGqU8stoZgWSZ8MQNpf gmail-_3jiriKeNer8y0-1r6oWIFM g=
mail-_2dlTXDaX9JuL0bekTwhV18" id=3D"gmail-SearchDropdown"><label class=3D"g=
mail-_2QGKgHKTtOwKHI4B_LI0YM" for=3D"header-search-bar"></label></div><div =
class=3D"gmail-_3dnbqz69WJTFCss8wl7Wlk"><div class=3D"gmail-_1blFGqU8stoZgW=
SZ8MQNpf gmail-_3jiriKeNer8y0-1r6oWIFM gmail-_2dlTXDaX9JuL0bekTwhV18" id=3D=
"gmail-SearchDropdown"><form action=3D"/search/" method=3D"get"><input type=
=3D"search" id=3D"gmail-header-search-bar" name=3D"q" class=3D"gmail-_2xQx4=
j6lBnDGQ8QsRnJEJa" value=3D""></form></div></div><div id=3D"email-verificat=
ion-tooltip-id" class=3D"gmail-XZK-LTFT5CgGo9MvPQQsy"><div id=3D"gmail-chan=
ge-username-tooltip-id" class=3D"gmail-XZK-LTFT5CgGo9MvPQQsy gmail-_20HfCAF=
z3ot1MW1o29ZoGZ"><span style=3D"color:rgb(0,0,0)"><span class=3D"gmail-_2zZ=
-KGHbWWqrwGlHWXR90y"></span></span></div></div><span style=3D"color:rgb(0,0=
,0)"><span class=3D"gmail-_2zZ-KGHbWWqrwGlHWXR90y"></span><span class=3D"gm=
ail-_2zZ-KGHbWWqrwGlHWXR90y"></span><span class=3D"gmail-_2zZ-KGHbWWqrwGlHW=
XR90y"></span></span>
<span style=3D"color:rgb(0,0,0)"><br>Hello to everyone.

</span><div class=3D"gmail-_3xX726aBn29LDbsDtzr_6E gmail-_1Ap4F5maDtT1E1YuC=
iaO0r gmail-D3IL3FD0RFy_mkKLPwL4" style=3D"max-width:800px"><div class=3D"g=
mail-_292iotee39Lmt0MkQZ2hPV gmail-RichTextJSON-root"><p class=3D"gmail-_1q=
eIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)">I&#39;m
  trying to make the nouveau driver work on my arch linux under ESXI 7.=20
I&#39;ve followed all the instructions located on the sites below :</span><=
/p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,=
0)"><br></span></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=
=3D"color:rgb(0,0,0)"><a href=3D"https://wiki.archlinux.org/index.php/nouve=
au" class=3D"gmail-_3t5uN8xUmg0TOwRCOGQEcU" rel=3D"noopener nofollow ugc" t=
arget=3D"_blank">https://wiki.archlinux.org/index.php/nouveau</a></span></p=
><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)=
"><br></span></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"=
color:rgb(0,0,0)">this is what I did :</span></p><p class=3D"gmail-_1qeIAgB=
0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)"><br></span></p><p class=
=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)"><code c=
lass=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">nano /etc/default/grub</code></span>=
</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0=
,0)"><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">GRUB_CMDLINE_LINUX=3D&qu=
ot;&quot;</code></span></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span=
 style=3D"color:rgb(0,0,0)"><br></span></p><p class=3D"gmail-_1qeIAgB0cPwnL=
hDF9XSiJM"><span style=3D"color:rgb(0,0,0)"><code class=3D"gmail-_34q3PgLsx=
9zIU5BiSOjFoM">nano /usr/lib/modprobe.d/nvidia.conf</code></span></p><p cla=
ss=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)"><code=
 class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">#blacklist nouveau</code></span></=
p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0=
)"><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">blacklist nvidia</code></s=
pan></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb=
(0,0,0)"><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">blacklist nvidia-gpu=
</code></span></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D=
"color:rgb(0,0,0)"><br></span></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM=
"><span style=3D"color:rgb(0,0,0)"><code class=3D"gmail-_34q3PgLsx9zIU5BiSO=
jFoM">nano /etc/mkinitcpio.conf</code></span></p><p class=3D"gmail-_1qeIAgB=
0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)"><code class=3D"gmail-_34q=
3PgLsx9zIU5BiSOjFoM">MODULES=3D(nouveau vmw_pvscsi vmw_vmci ata_piix)</code=
></span></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color=
:rgb(0,0,0)"><br></span></p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><spa=
n style=3D"color:rgb(0,0,0)"><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">=
mkinitcpio -P ALL and rebooted</code></span></p><p class=3D"gmail-_1qeIAgB0=
cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)"><br></span></p><p class=3D=
"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)">this is ho=
w the nouveau driver handles my RTX 2080 ti :</span></p><p class=3D"gmail-_=
1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)"><br></span></p><p =
class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)"><c=
ode class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.661817] fbcon:=
 Taking over console</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM=
">[ =C2=A0 =C2=A00.661852] Console: switching to colour frame buffer device=
 128x48</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =
=C2=A00.670423] Linux agpgart interface v0.103</code><br><code class=3D"gma=
il-_34q3PgLsx9zIU5BiSOjFoM">[
 =C2=A0 =C2=A00.702390] ACPI Warning: \_SB.PCI0.PE50.S1F0._DSM: Argument #4=
 type=20
mismatch - Found [Buffer], ACPI requires [Package]=20
(20200717/nsarguments-59)</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiS=
OjFoM">[ =C2=A0 =C2=A00.702471] nouveau 0000:0b:00.0: enabling device (0000=
 -&gt; 0003)</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=
=A0 =C2=A00.703449] checking generic (e8000000 300000) vs hw (fb000000 1000=
000)</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=
=A00.703449] checking generic (e8000000 300000) vs hw (c0000000 10000000)</=
code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.703=
450] checking generic (e8000000 300000) vs hw (d0000000 2000000)</code><br>=
<code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.703823] nouv=
eau 0000:0b:00.0: NVIDIA TU102 (162000a1)</code><br><code class=3D"gmail-_3=
4q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.787386] nouveau 0000:0b:00.0: bios:=
 version 90.02.17.00.71</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOj=
FoM">[ =C2=A0 =C2=A00.787671] nouveau 0000:0b:00.0: pmu: firmware unavailab=
le</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00=
.788358] nouveau 0000:0b:00.0: bus: MMIO write of 00000000 FAULT at 009410 =
[ TIMEOUT ]</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=
=A0 =C2=A00.788389] nouveau 0000:0b:00.0: fb: 11264 MiB GDDR6</code><br><co=
de class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[
 =C2=A0 =C2=A00.795940] nouveau 0000:0b:00.0: fifo: fault 01 [VIRT_WRITE] a=
t=20
00000000000bd000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 0d=20
[REGION_VIOLATION] on channel -1 [02bfedf000 unknown]</code><br><code class=
=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[
 =C2=A0 =C2=A00.879293] nouveau 0000:0b:00.0: fifo: fault 00 [VIRT_READ] at=
=20
00000000000bd000 engine c0 [BAR2] client 07 [HUB/HOST_CPU] reason 0d=20
[REGION_VIOLATION] on channel -1 [02bfedf000 unknown]</code><br><code class=
=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944029] BUG: unable to =
handle page fault for address: ffffb0a4c0d00000</code><br><code class=3D"gm=
ail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944088] #PF: supervisor read =
access in kernel mode</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFo=
M">[ =C2=A0 =C2=A00.944118] #PF: error_code(0x0000) - not-present page</cod=
e><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944148=
] PGD 42e000067 P4D 42e000067 PUD 42e195067 PMD 429098067 PTE 0</code><br><=
code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944182] Oops:=
 0000 [#1] PREEMPT SMP NOPTI</code><br><code class=3D"gmail-_34q3PgLsx9zIU5=
BiSOjFoM">[ =C2=A0 =C2=A00.944212] CPU: 2 PID: 291 Comm: modprobe Not taint=
ed 5.9.8-arch1-1 #1</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM"=
>[
 =C2=A0 =C2=A00.944244] Hardware name: VMware, Inc. VMware7,1/440BX Desktop=
=20
Reference Platform, BIOS VMW71.00V.15401161.B64.2001021853 01/02/2020</code=
><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944307]=
 RIP: 0010:ioread32+0x27/0x60</code><br><code class=3D"gmail-_34q3PgLsx9zIU=
5BiSOjFoM">[
 =C2=A0 =C2=A00.944337] Code: 00 00 90 48 81 ff ff ff 03 00 77 1e 48 81 ff =
00 00=20
01 00 76 05 0f b7 d7 ed c3 8b 15 8b 2c 42 01 b8 ff ff ff ff 85 d2 75 04=20
c3 &lt;8b&gt; 07 c3 83 ea 01 48 83 ec 08 48 89 fe 48 c7 c7 a8 c3 18 88=20
89 15</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=
=A00.944407] RSP: 0018:ffffb0a4c0b4b600 EFLAGS: 00010292</code><br><code cl=
ass=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944439] RAX: fffffff=
fc0363dc0 RBX: ffffa12f6a399800 RCX: 0000000000000000</code><br><code class=
=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944472] RDX: 00000000ba=
d0acfe RSI: ffffb0a4c0d00000 RDI: ffffb0a4c0d00000</code><br><code class=3D=
"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944505] RBP: ffffb0a4c0b4b=
63c R08: ffffa12f6906bf80 R09: 000000000000d300</code><br><code class=3D"gm=
ail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944537] R10: 0000000000000000=
 R11: ffffb0a4c0000000 R12: ffffb0a4c0b4b738</code><br><code class=3D"gmail=
-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944570] R13: ffffa12f6a399850 R1=
4: ffffb0a4c0b4b648 R15: 0000000000000000</code><br><code class=3D"gmail-_3=
4q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944604] FS: =C2=A000007fc80fdc5740(=
0000) GS:ffffa12f6fc80000(0000) knlGS:0000000000000000</code><br><code clas=
s=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944639] CS: =C2=A00010=
 DS: 0000 ES: 0000 CR0: 0000000080050033</code><br><code class=3D"gmail-_34=
q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944670] CR2: ffffb0a4c0d00000 CR3: 0=
0000004296ac003 CR4: 00000000003706e0</code><br><code class=3D"gmail-_34q3P=
gLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944715] Call Trace:</code><br><code cla=
ss=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944766] =C2=A0gp102_a=
cr_wpr_patch+0xa8/0x190 [nouveau]</code><br><code class=3D"gmail-_34q3PgLsx=
9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944817] =C2=A0nvkm_acr_oneinit+0x337/0x580 =
[nouveau]</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =
=C2=A00.944865] =C2=A0nvkm_subdev_init+0x53/0xd0 [nouveau]</code><br><code =
class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.944898] =C2=A0? kt=
ime_get+0x38/0xa0</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[=
 =C2=A0 =C2=A00.944952] =C2=A0nvkm_device_init+0x10b/0x190 [nouveau]</code>=
<br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.945009] =
=C2=A0nvkm_udevice_init+0x41/0x60 [nouveau]</code><br><code class=3D"gmail-=
_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.945056] =C2=A0nvkm_object_init+0x=
3e/0x100 [nouveau]</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">=
[ =C2=A0 =C2=A00.945102] =C2=A0nvkm_ioctl_new+0x177/0x1f0 [nouveau]</code><=
br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.945148] =
=C2=A0? nvkm_client_notify+0x30/0x30 [nouveau]</code><br><code class=3D"gma=
il-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.945204] =C2=A0? nvkm_udevice_r=
d08+0x20/0x20 [nouveau]</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOj=
FoM">[ =C2=A0 =C2=A00.945251] =C2=A0nvkm_ioctl+0xde/0x180 [nouveau]</code><=
br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.945296] =
=C2=A0nvif_object_ctor+0x11e/0x1c0 [nouveau]</code><br><code class=3D"gmail=
-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.945343] =C2=A0nvif_device_ctor+0=
x1f/0x60 [nouveau]</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">=
[ =C2=A0 =C2=A00.945400] =C2=A0nouveau_cli_init+0x1c3/0x480 [nouveau]</code=
><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.945458]=
 =C2=A0nouveau_drm_device_init+0x74/0x7a0 [nouveau]</code><br><code class=
=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.945491] =C2=A0? pci_bus=
_read_config_word+0x49/0x70</code><br><code class=3D"gmail-_34q3PgLsx9zIU5B=
iSOjFoM">[ =C2=A0 =C2=A00.945548] =C2=A0nouveau_drm_probe+0x138/0x200 [nouv=
eau]</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=
=A00.945581] =C2=A0? _raw_spin_unlock_irqrestore+0x20/0x40</code><br><code =
class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.945613] =C2=A0loca=
l_pci_probe+0x42/0x80</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFo=
M">[ =C2=A0 =C2=A00.945644] =C2=A0? pci_match_device+0xd7/0x100</code><br><=
code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.946142] =C2=
=A0pci_device_probe+0xfa/0x1b0</code><br><code class=3D"gmail-_34q3PgLsx9zI=
U5BiSOjFoM">[ =C2=A0 =C2=A00.946481] =C2=A0really_probe+0x205/0x460</code><=
br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.946811] =
=C2=A0driver_probe_device+0xe1/0x150</code><br><code class=3D"gmail-_34q3Pg=
Lsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.947135] =C2=A0device_driver_attach+0xa1/=
0xb0</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=
=A00.947448] =C2=A0__driver_attach+0x8a/0x150</code><br><code class=3D"gmai=
l-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.947750] =C2=A0? device_driver_a=
ttach+0xb0/0xb0</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =
=C2=A0 =C2=A00.948043] =C2=A0? device_driver_attach+0xb0/0xb0</code><br><co=
de class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.948328] =C2=A0b=
us_for_each_dev+0x89/0xd0</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiS=
OjFoM">[ =C2=A0 =C2=A00.948609] =C2=A0bus_add_driver+0x12b/0x1e0</code><br>=
<code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.948891] =C2=
=A0driver_register+0x8b/0xe0</code><br><code class=3D"gmail-_34q3PgLsx9zIU5=
BiSOjFoM">[ =C2=A0 =C2=A00.949167] =C2=A0? 0xffffffffc0552000</code><br><co=
de class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.949439] =C2=A0d=
o_one_initcall+0x59/0x240</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiS=
OjFoM">[ =C2=A0 =C2=A00.949709] =C2=A0do_init_module+0x5c/0x260</code><br><=
code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.949968] =C2=
=A0load_module+0x21a7/0x2450</code><br><code class=3D"gmail-_34q3PgLsx9zIU5=
BiSOjFoM">[ =C2=A0 =C2=A00.950217] =C2=A0__do_sys_finit_module+0xbd/0x120</=
code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.950=
466] =C2=A0do_syscall_64+0x33/0x40</code><br><code class=3D"gmail-_34q3PgLs=
x9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.950709] =C2=A0entry_SYSCALL_64_after_hwfra=
me+0x44/0xa9</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=
=A0 =C2=A00.950943] RIP: 0033:0x7fc80feecd5d</code><br><code class=3D"gmail=
-_34q3PgLsx9zIU5BiSOjFoM">[
 =C2=A0 =C2=A00.951172] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f =
1e fa=20
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f=20
05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 70 0c 00 f7 d8 64 89=20
01 48</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=
=A00.951658] RSP: 002b:00007ffde760d6b8 EFLAGS: 00000246 ORIG_RAX: 00000000=
00000139</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =
=C2=A00.951906] RAX: ffffffffffffffda RBX: 0000564274ad29f0 RCX: 00007fc80f=
eecd5d</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=
=A00.952154] RDX: 0000000000000000 RSI: 00005642735a4288 RDI: 0000000000000=
010</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A0=
0.952403] RBP: 0000000000060000 R08: 0000000000000000 R09: 0000000000000000=
</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.9=
52686] R10: 0000000000000010 R11: 0000000000000246 R12: 00005642735a4288</c=
ode><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.9529=
25] R13: 0000000000000000 R14: 0000564274ad2a70 R15: 0000564274ad29f0</code=
><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[
 =C2=A0 =C2=A00.953161] Modules linked in: nouveau(+) mxm_wmi wmi i2c_algo_=
bit ttm
 drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops cec=20
rc_core drm agpgart</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM"=
>[ =C2=A0 =C2=A00.953658] CR2: ffffb0a4c0d00000</code><br><code class=3D"gm=
ail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.953904] ---[ end trace 0c45b1=
97538c3e5e ]---</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =
=C2=A0 =C2=A00.954152] RIP: 0010:ioread32+0x27/0x60</code><br><code class=
=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[
 =C2=A0 =C2=A00.954445] Code: 00 00 90 48 81 ff ff ff 03 00 77 1e 48 81 ff =
00 00=20
01 00 76 05 0f b7 d7 ed c3 8b 15 8b 2c 42 01 b8 ff ff ff ff 85 d2 75 04=20
c3 &lt;8b&gt; 07 c3 83 ea 01 48 83 ec 08 48 89 fe 48 c7 c7 a8 c3 18 88=20
89 15</code><br><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=
=A00.954975] RSP: 0018:ffffb0a4c0b4b600 EFLAGS: 00010292</code><br><code cl=
ass=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.955246] RAX: fffffff=
fc0363dc0 RBX: ffffa12f6a399800 RCX: 0000000000000000</code><br><code class=
=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.955522] RDX: 00000000ba=
d0acfe RSI: ffffb0a4c0d00000 RDI: ffffb0a4c0d00000</code><br><code class=3D=
"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.955800] RBP: ffffb0a4c0b4b=
63c R08: ffffa12f6906bf80 R09: 000000000000d300</code><br><code class=3D"gm=
ail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.956079] R10: 0000000000000000=
 R11: ffffb0a4c0000000 R12: ffffb0a4c0b4b738</code><br><code class=3D"gmail=
-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.956360] R13: ffffa12f6a399850 R1=
4: ffffb0a4c0b4b648 R15: 0000000000000000</code><br><code class=3D"gmail-_3=
4q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.956788] FS: =C2=A000007fc80fdc5740(=
0000) GS:ffffa12f6fc80000(0000) knlGS:0000000000000000</code><br><code clas=
s=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.958042] CS: =C2=A00010=
 DS: 0000 ES: 0000 CR0: 0000000080050033</code><br><code class=3D"gmail-_34=
q3PgLsx9zIU5BiSOjFoM">[ =C2=A0 =C2=A00.958356] CR2: ffffb0a4c0d00000 CR3: 0=
0000004296ac003 CR4: 00000000003706e0</code></span></p><p class=3D"gmail-_1=
qeIAgB0cPwnLhDF9XSiJM"><span style=3D"color:rgb(0,0,0)">have I skipped some=
 relevant step ? Let me know,thanks.</span></p></div></div>

-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_s=
ignature">Mario.<br></div></div>

--000000000000c832c305b509f8eb--

--===============1746576586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1746576586==--
