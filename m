Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281D53CEDEA
	for <lists+nouveau@lfdr.de>; Mon, 19 Jul 2021 22:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BAD89A75;
	Mon, 19 Jul 2021 20:53:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1016 seconds by postgrey-1.36 at gabe;
 Mon, 19 Jul 2021 20:53:40 UTC
Received: from smtpq3.tb.ukmail.iss.as9143.net
 (smtpq3.tb.ukmail.iss.as9143.net [212.54.57.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8999B89991
 for <nouveau@lists.freedesktop.org>; Mon, 19 Jul 2021 20:53:40 +0000 (UTC)
Received: from [212.54.57.96] (helo=smtpq1.tb.ukmail.iss.as9143.net)
 by smtpq3.tb.ukmail.iss.as9143.net with esmtp (Exim 4.86_2)
 (envelope-from <sboyce@blueyonder.co.uk>) id 1m5a0K-0005eG-93
 for nouveau@lists.freedesktop.org; Mon, 19 Jul 2021 22:36:44 +0200
Received: from [212.54.57.108] (helo=csmtp4.tb.ukmail.iss.as9143.net)
 by smtpq1.tb.ukmail.iss.as9143.net with esmtp (Exim 4.86_2)
 (envelope-from <sboyce@blueyonder.co.uk>) id 1m5a0I-0002fL-B0
 for nouveau@lists.freedesktop.org; Mon, 19 Jul 2021 22:36:42 +0200
Received: from [192.168.10.232] ([82.40.7.93]) by cmsmtp with ESMTPA
 id 5a0HmTL1qXATf5a0ImHzVa; Mon, 19 Jul 2021 22:36:42 +0200
X-Originating-IP: [82.40.7.93]
X-Authenticated-Sender: sboyce@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.4 cv=MaEPB7zf c=1 sm=1 tr=0 ts=60f5e25a cx=a_exe
 a=0t5s/6s+ZVRG1rmEzJFcZA==:117 a=0t5s/6s+ZVRG1rmEzJFcZA==:17
 a=N659UExz7-8A:10 a=e_q4qTt1xDgA:10 a=x7bEGLp0ZPQA:10
 a=SstKv4r0OY_JQFghaUIA:9 a=pILNOxqGKmIA:10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blueyonder.co.uk;
 s=meg.feb2017; t=1626727002;
 bh=DTxX7P9JkTnloh2BIqVzjh05SUtz+QooPitjDwt3ID4=;
 h=From:Subject:Reply-To:To:Date;
 b=hpIrejuY6dFv5rXAwcvslwlZSCVS4a+Mzd//cxc/CEVKTGYwbuk5NSQyzJtm2hwAb
 vcMpwsWKDYUUcjK08Pk7f4sae+er53cbBj4eggPUMIs95dSp+G66hNRF3l1MTXbpog
 ugZnFD+PS4xlNnU/Tdyx6AA/ntrNtRQHAtbh+vWRlCptxtc8NvgBlyFpO0w+WflA33
 t/C+PBIij4RGydoD3T2AU9YmSu7dnrJlh3ua6gMDDki2mAoJRJD3aAd5ESrt6XrMDw
 Bd2N3wplK+ZeQpB9NpItyJYW+S620mtCE7jYyxtOan0YJSnChiVRLp2X5QAmHsZcNO
 6vqYG3IEI8Gsw==
From: Sid Boyce <sboyce@blueyonder.co.uk>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Organization: blueyonder.co.uk
Message-ID: <02813601-91da-5ab3-7852-1947c7bbf84c@blueyonder.co.uk>
Date: Mon, 19 Jul 2021 21:36:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-GB
X-CMAE-Envelope: MS4xfGq1UHStoajjQA/cSCP4FR2LAunGbUOwVvI+OXjrPBPGa/MrIozl8xBMfR9fpmRSzxxLxD+z6VAs71466QmDjT0/+ucwLh05FmA+w9+yqVwRRm8eEH9G
 3I2UkfANAafuYzhlx+NSe/9tfNLJSaVn9aX52pJFAIhB/RQt8Jl3pbMWUTxljontNVImAkCsTt92ONaYn//pcq1APs40iaUkvHY=
Subject: [Nouveau] nouveau failure 5.14-rc1 and -rc2
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Also sent this to kernel mailing list.

I saw an earlier kernel mailing list post (week 8 - 15 July) that so far =

hasn't made it into 5.14-rc.


GPU's are GeForce GTX 1650, and 2 with GeForce GTX 1050 Ti.

3 systems affected, nothing displayed during boot up. I use ssh from a =

running system to look at dmesg output.

[Mon Jul 19 00:02:06 2021] hid-generic 0003:0CCD:0028.0004: =

input,hidraw3: USB HID v1.00 Device [USB Audio] on usb-0000:05:00.3-4/input3
[Mon Jul 19 00:02:06 2021] usb 5-6: new full-speed USB device number 4 =

using xhci_hcd
[Mon Jul 19 00:02:06 2021] usb 5-6: config 1 has an invalid interface =

number: 2 but max is 1
[Mon Jul 19 00:02:06 2021] usb 5-6: config 1 has no interface number 1
[Mon Jul 19 00:02:06 2021] usb 5-6: New USB device found, idVendor=3D0b05, =

idProduct=3D18f3, bcdDevice=3D 1.00
[Mon Jul 19 00:02:06 2021] usb 5-6: New USB device strings: Mfr=3D1, =

Product=3D2, SerialNumber=3D3
[Mon Jul 19 00:02:06 2021] usb 5-6: Product: AURA LED Controller
[Mon Jul 19 00:02:06 2021] usb 5-6: Manufacturer: AsusTek Computer Inc.
[Mon Jul 19 00:02:06 2021] usb 5-6: SerialNumber: 9876543210
[Mon Jul 19 00:02:06 2021] hid-generic 0003:0B05:18F3.0005: =

hiddev96,hidraw4: USB HID v1.11 Device [AsusTek Computer Inc. AURA LED =

Controller] on usb-0000:05:00.3-6/input2
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: VRAM: 4096 MiB
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: TMDS table version 2.0
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB version 4.0
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 00: =

02000300 00000000
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 01: =

01000302 00020030
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 02: =

04011380 00000000
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 03: =

08011382 00020030
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB outp 04: =

02022362 00020010
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB conn 00: 00001030
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB conn 01: 00000100
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: DCB conn 02: 00002261
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: DRM: failed to =

initialise sync subsystem, -28
[Mon Jul 19 00:02:07 2021] nouveau 0000:08:00.0: bus: MMIO write of =

00000002 FAULT at 13c154 [ PRIVRING ]
[Mon Jul 19 00:02:07 2021] nouveau: probe of 0000:08:00.0 failed with =

error -28
[Mon Jul 19 00:02:08 2021] EXT4-fs (sda2): mounted filesystem with =

ordered data mode. Opts: (null). Quota mode: none.
[Mon Jul 19 00:02:08 2021] systemd-journald[286]: Received SIGTERM from =

PID 1 (systemd).
[Mon Jul 19 00:02:09 2021] systemd[1]: systemd 248.3+suse.30.ge9a23d9e06 =

running in system mode. (+PAM +AUDIT +SELINUX +APPARMOR -IMA -SMACK =

+SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 =

+IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY =

+P11KIT +QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -XKBCOMMON +UTMP +SYSVINIT =

default-hierarchy=3Dunified)
[Mon Jul 19 00:02:09 2021] systemd[1]: Detected architecture x86-64.
[Mon Jul 19 00:02:21 2021] systemd-sysv-generator[619]: SysV service =

'/etc/init.d/vmware-USBArbitrator' lacks a native systemd unit file. =

Automatically generating a unit file for compatibility. Please update =

package to include a native systemd unit file, in order to make it more =

safe and robust.
[Mon Jul 19 00:02:21 2021] systemd-sysv-generator[619]: SysV service =

'/etc/init.d/webmin' lacks a native systemd unit file. Automatically =

generating a unit file for compatibility. Please update package to =

include a native systemd unit file, in order to make it more safe and =

robust.
[Mon Jul 19 00:02:21 2021] systemd-sysv-generator[619]: SysV service =

'/etc/init.d/vmware' lacks a native systemd unit file. Automatically =

generating a unit file for compatibility. Please update package to =

include a native systemd unit file, in order to make it more safe and =

robust.
[Mon Jul 19 00:02:22 2021] systemd[1]: /etc/systemd/system/tmp.mount: =

symlinks are not allowed for units of this type, rejecting.
[Mon Jul 19 00:02:23 2021] systemd[1]: =

/usr/lib/systemd/system/netdata.service:14: PIDFile=3D references a path =

below legacy directory /var/run/, updating /var/run/netdata/netdata.pid =

=E2=86=92 /run/netdata/netdata.pid; please update the unit file accordingly.
[Mon Jul 19 00:02:23 2021] systemd[1]: =

/usr/lib/systemd/system/plymouth-start.service:15: Unit configured to =

use KillMode=3Dnone. This is unsafe, as it disables systemd's process =

lifecycle management for the service. Please update your service to use =

a safer KillMode=3D, such as 'mixed' or 'control-group'. Support for =

KillMode=3Dnone is deprecated and will eventually be removed.
[Mon Jul 19 00:02:23 2021] systemd[1]: haveged.service: Main process =

exited, code=3Dexited, status=3D1/FAILURE
[Mon Jul 19 00:02:23 2021] systemd[1]: haveged.service: Failed with =

result 'exit-code'.
[Mon Jul 19 00:02:23 2021] systemd[1]: Stopped Entropy Daemon based on =

the HAVEGE algorithm.
[Mon Jul 19 00:02:23 2021] systemd[1]: initrd-switch-root.service: =

Deactivated successfully.
[Mon Jul 19 00:02:23 2021] systemd[1]: Stopped Switch Root.
[Mon Jul 19 00:02:23 2021] systemd[1]: systemd-journald.service: =

Scheduled restart job, restart counter is at 1.
[Mon Jul 19 00:02:23 2021] systemd[1]: Created slice system-getty.slice.
[Mon Jul 19 00:02:23 2021] systemd[1]: Created slice system-modprobe.slice.
[Mon Jul 19 00:02:23 2021] systemd[1]: Created slice User and Session Slice.
[Mon Jul 19 00:02:23 2021] systemd[1]: Set up automount Arbitrary =

Executable File Formats File System Automount Point.

Regards

Sid.

-- =

Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
Senior Staff Specialist, Cricket Coach
Microsoft Windows Free Zone - Linux used for all Computing Tasks

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
