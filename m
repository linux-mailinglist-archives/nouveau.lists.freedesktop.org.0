Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6C3D1452
	for <lists+nouveau@lfdr.de>; Wed, 21 Jul 2021 18:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B149D6EC0A;
	Wed, 21 Jul 2021 16:41:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtpq1.tb.ukmail.iss.as9143.net
 (smtpq1.tb.ukmail.iss.as9143.net [212.54.57.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01C56EC0A
 for <nouveau@lists.freedesktop.org>; Wed, 21 Jul 2021 16:41:48 +0000 (UTC)
Received: from [212.54.57.112] (helo=csmtp8.tb.ukmail.iss.as9143.net)
 by smtpq1.tb.ukmail.iss.as9143.net with esmtp (Exim 4.86_2)
 (envelope-from <sboyce@blueyonder.co.uk>) id 1m6FI3-0007nQ-4I
 for nouveau@lists.freedesktop.org; Wed, 21 Jul 2021 18:41:47 +0200
Received: from [192.168.10.232] ([82.40.7.93]) by cmsmtp with ESMTPA
 id 6FI2mEy19WWOW6FI2meXUW; Wed, 21 Jul 2021 18:41:47 +0200
X-Originating-IP: [82.40.7.93]
X-Authenticated-Sender: sboyce@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.4 cv=H5m4f8Ui c=1 sm=1 tr=0 ts=60f84e4b cx=a_exe
 a=0t5s/6s+ZVRG1rmEzJFcZA==:117 a=0t5s/6s+ZVRG1rmEzJFcZA==:17
 a=N659UExz7-8A:10 a=e_q4qTt1xDgA:10 a=x7bEGLp0ZPQA:10 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=a5Gf7U6LAAAA:8 a=e5mUnYsNAAAA:8 a=mvCX7tj1kt5k_Y4krggA:9
 a=pILNOxqGKmIA:10 a=AjGcO6oz07-iQ99wixmX:22 a=VWYBCMy2-3DvUfgBPAUA:22
 a=Vxmtnl_E_bksehYqCbjh:22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blueyonder.co.uk;
 s=meg.feb2017; t=1626885707;
 bh=y3BkSDeYLiYjXi9b3I+42ToYO5ypSlbye0rf+kdFuGY=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=GDjOkM9WEaftQQQpBwx7GYIBgL5EbJKbqTr2q1k39/4mXRPfcgT/bvIuBggx7EpqY
 YXGJp2vFy/5FamW4mt7NMo6xBiWulxGG8fAgH12Dx4oj0yAkCXG+O8gptpaI7qV92U
 9oYc4+RDRfvJyJhii0I7Frxr+sZR0VVUsTpYk6PilVyDyLb7izYUewkVdSUcSb6AwM
 ywnmr4vgI4MbBs6gHx/7nN5Vav8lGWHGOcn8PG2DM8MtrYz3To7/Pupr2Meqv0fhq/
 TQyCmkjfNV5hhzVT2aUl4/r3xmsR9hsiFY2bgmpS75tY8K7oqddCJmIVm/c0cIJNhb
 EVqXzsfM+3auw==
To: Karol Herbst <kherbst@redhat.com>
References: <02813601-91da-5ab3-7852-1947c7bbf84c@blueyonder.co.uk>
 <CACO55tvQr5Te3hgn6OXFba30gQPUy2vOBbYnAMgWXXOHZGxTLA@mail.gmail.com>
 <CACO55tsVhQPSocHOyS4a74K7gN2s2tRHsn3h0xbLWG7eikSg5w@mail.gmail.com>
From: Sid Boyce <sboyce@blueyonder.co.uk>
Organization: blueyonder.co.uk
Message-ID: <eec04424-4a0b-f20f-1995-02e10e0276bf@blueyonder.co.uk>
Date: Wed, 21 Jul 2021 17:41:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACO55tsVhQPSocHOyS4a74K7gN2s2tRHsn3h0xbLWG7eikSg5w@mail.gmail.com>
Content-Language: en-GB
X-CMAE-Envelope: MS4xfImpAlK7JpnoI3+3g6iXBFIzEEricKMfHV8rY9wU/ppVI7rrDxB4HUsYF48k7Ud75rlVimto8Iq3dKpNLYLa8Qyx/ZcOEB4JDvc6uAhYwDczjVchrq0Z
 pxRkqgSCVcnpqfhOP4+wVtpu5Y6NLmUYYxyvWFmoTXGX/MZdSSd4coacjPQ4N/feIftt/vOG2iWostKou4KH7AWrjIGG/MRWJC8TbPLMS+YD3F4itOpnPzt4
Subject: Re: [Nouveau] nouveau failure 5.14-rc1 and -rc2
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
Reply-To: sboyce@blueyonder.co.uk
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Excellent, thanks.
I could have done a git bisect from another box. I didn't think of it.
Regards
Sid.

On 21/07/2021 14:16, Karol Herbst wrote:
> actually.. it was already found in this thread:
> https://lore.kernel.org/lkml/YOC4uekpD7iA3xPi@Red/T/ fixes incoming.
>
> On Wed, Jul 21, 2021 at 3:13 PM Karol Herbst <kherbst@redhat.com> wrote:
>> fyi: I am able to reproduce it on my machine and will figure out
>> what's wrong. Thanks!
>>
>> On Mon, Jul 19, 2021 at 10:53 PM Sid Boyce <sboyce@blueyonder.co.uk> wro=
te:
>>> Also sent this to kernel mailing list.
>>>
>>> I saw an earlier kernel mailing list post (week 8 - 15 July) that so far
>>> hasn't made it into 5.14-rc.
>>>
>>>
>>> GPU's are GeForce GTX 1650, and 2 with GeForce GTX 1050 Ti.
>>>
>>> 3 systems affected, nothing displayed during boot up. I use ssh from a
>>> running system to look at dmesg output.
>>>
>>> [Mon Jul 19 00:02:06 2021] hid-generic 0003:0CCD:0028.0004:
>>> input,hidraw3: USB HID v1.00 Device [USB Audio] on usb-0000:05:00.3-4/i=
nput3
>>> [Mon Jul 19 00:02:06 2021] usb 5-6: new full-speed USB device number 4
>>> using xhci_hcd
>>> [Mon Jul 19 00:02:06 2021] usb 5-6: config 1 has an invalid interface
>>> number: 2 but max is 1
>>> [Mon Jul 19 00:02:06 2021] usb 5-6: config 1 has no interface number 1
>>> [Mon Jul 19 00:02:06 2021] usb 5-6: New USB device found, idVendor=3D0b=
05,
>>> idProduct=3D18f3, bcdDevice=3D 1.00
>>> [Mon Jul 19 00:02:06 2021] usb 5-6: New USB device strings: Mfr=3D1,
>>> Product=3D2, SerialNumber=3D3
>>> [Mon Jul 19 00:02:06 2021] usb 5-6: Product: AURA LED Controller
>>> [Mon Jul 19 00:02:06 2021] usb 5-6: Manufacturer: AsusTek Computer Inc.
>>> [Mon Jul 19 00:02:06 2021] usb 5-6: SerialNumber: 9876543210
>>> [Mon Jul 19 00:02:06 2021] hid-generic 0003:0B05:18F3.0005:
>>> hiddev96,hidraw4: USB HID v1.11 Device [AsusTek Computer Inc. AURA LED
>>> Controller] on usb-0000:05:00.3-6/input2
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: VRAM: 4096 MiB
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: TMDS table versio=
n 2.0
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB version 4.0
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 00:
>>> 02000300 00000000
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 01:
>>> 01000302 00020030
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 02:
>>> 04011380 00000000
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 03:
>>> 08011382 00020030
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 04:
>>> 02022362 00020010
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB conn 00: 0000=
1030
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB conn 01: 0000=
0100
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB conn 02: 0000=
2261
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: failed to
>>> initialise sync subsystem, -28
>>> [Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: bus: MMIO write of
>>> 00000002 FAULT at 13c154 [ PRIVRING ]
>>> [Mon Jul 19 00:02:07 2021] nouveau: probe of 0000:08:00.0 failed with
>>> error -28
>>> [Mon Jul 19 00:02:08 2021] EXT4-fs (sda2): mounted filesystem with
>>> ordered data mode. Opts: (null). Quota mode: none.
>>> [Mon Jul 19 00:02:08 2021] systemd-journald[286]: Received SIGTERM from
>>> PID 1 (systemd).
>>> [Mon Jul 19 00:02:09 2021] systemd[1]: systemd 248.3+suse.30.ge9a23d9e06
>>> running in system mode. (+PAM +AUDIT +SELINUX +APPARMOR -IMA -SMACK
>>> +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2
>>> +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY
>>> +P11KIT +QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -XKBCOMMON +UTMP +SYSVINIT
>>> default-hierarchy=3Dunified)
>>> [Mon Jul 19 00:02:09 2021] systemd[1]: Detected architecture x86-64.
>>> [Mon Jul 19 00:02:21 2021] systemd-sysv-generator[619]: SysV service
>>> '/etc/init.d/vmware-USBArbitrator' lacks a native systemd unit file.
>>> Automatically generating a unit file for compatibility. Please update
>>> package to include a native systemd unit file, in order to make it more
>>> safe and robust.
>>> [Mon Jul 19 00:02:21 2021] systemd-sysv-generator[619]: SysV service
>>> '/etc/init.d/webmin' lacks a native systemd unit file. Automatically
>>> generating a unit file for compatibility. Please update package to
>>> include a native systemd unit file, in order to make it more safe and
>>> robust.
>>> [Mon Jul 19 00:02:21 2021] systemd-sysv-generator[619]: SysV service
>>> '/etc/init.d/vmware' lacks a native systemd unit file. Automatically
>>> generating a unit file for compatibility. Please update package to
>>> include a native systemd unit file, in order to make it more safe and
>>> robust.
>>> [Mon Jul 19 00:02:22 2021] systemd[1]: /etc/systemd/system/tmp.mount:
>>> symlinks are not allowed for units of this type, rejecting.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]:
>>> /usr/lib/systemd/system/netdata.service:14: PIDFile=3D references a path
>>> below legacy directory /var/run/, updating /var/run/netdata/netdata.pid
>>> =E2=86=92 /run/netdata/netdata.pid; please update the unit file accordi=
ngly.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]:
>>> /usr/lib/systemd/system/plymouth-start.service:15: Unit configured to
>>> use KillMode=3Dnone. This is unsafe, as it disables systemd's process
>>> lifecycle management for the service. Please update your service to use
>>> a safer KillMode=3D, such as 'mixed' or 'control-group'. Support for
>>> KillMode=3Dnone is deprecated and will eventually be removed.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: haveged.service: Main process
>>> exited, code=3Dexited, status=3D1/FAILURE
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: haveged.service: Failed with
>>> result 'exit-code'.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: Stopped Entropy Daemon based on
>>> the HAVEGE algorithm.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: initrd-switch-root.service:
>>> Deactivated successfully.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: Stopped Switch Root.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: systemd-journald.service:
>>> Scheduled restart job, restart counter is at 1.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: Created slice system-getty.slice.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: Created slice system-modprobe.sl=
ice.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: Created slice User and Session S=
lice.
>>> [Mon Jul 19 00:02:23 2021] systemd[1]: Set up automount Arbitrary
>>> Executable File Formats File System Automount Point.
>>>
>>> Regards
>>>
>>> Sid.
>>>
>>> --
>>> Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
>>> Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
>>> Senior Staff Specialist, Cricket Coach
>>> Microsoft Windows Free Zone - Linux used for all Computing Tasks
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>>

-- =

Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
Senior Staff Specialist, Cricket Coach
Microsoft Windows Free Zone - Linux used for all Computing Tasks

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
