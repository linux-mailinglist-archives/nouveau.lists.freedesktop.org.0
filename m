Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E167A6F6B44
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE07510E3A8;
	Thu,  4 May 2023 12:31:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909A010E9A9
 for <nouveau@lists.freedesktop.org>; Fri, 27 Jan 2023 15:52:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so14893088ejc.4
 for <nouveau@lists.freedesktop.org>; Fri, 27 Jan 2023 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=guSQQsPsfTpqh05BsPnGdHThXLaG3PZgG3GcERxsikE=;
 b=l1cAUlEswCEWcTC5cDGszLbYSt1RK5TUz71tZk1XgI+3ImPiLv6Q0R7mDHOskZQ5In
 Jf0OcSlmWS1AR2CrO2RJ60rzbE92TBYMdDzv7C9Cc0ieDh9yZ85fhiFx4zfeAaNPKVeR
 MLjey51wNFIh64lLPpgtu6sbHJmDR47VMK5dHocZrYVgC3afL0JfDuLZCS8QCk8rrHtR
 +UmU3MZ9xoT9b/Q29KSGNltVsMrZdgVNer785JB+YgKgxgTK2Dd4SYQDdOmZXGvL9DRK
 lKuFJN6xOeefHrdZdOwPsh9m59n5WVro0y8Y/+ddvDatLoH1tgXUqpDWM3UGwrR28qfk
 GZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=guSQQsPsfTpqh05BsPnGdHThXLaG3PZgG3GcERxsikE=;
 b=l9peQtVEB9EuT1mwboTLYWd9HkqTpBpj3+pWH7kXx6brlxlilj/XiYwblWAGsEP/um
 vD/PQpkYCTgg6w3SGd5hwbmuUAfiJswH9BgjgpE5LZMeBxwIxvNW1fN/qzRvSNSs5xf0
 BVrmU4fyJpLam/at7boDBj1ntahr2fd5RYcYw+uinFQH3sN5S2O4EtHN9hfuOCAxfcEs
 dFq0l+/NX1fRSjw2f29mhNRD5BE+LePeAiHjhOim9HHicU8LzRPYCc9b9JUVmcDYgBJ1
 p1O2HGedmU7QFkmKfaoPia0kcWgX8eJngyHgek0BHX9B8DgFwZCXYNMMk0TnyXuTViLT
 ALQw==
X-Gm-Message-State: AO0yUKWBhL55r0luUGZ4qLR3j6NSSSex2wDVv0X/Ch840IVu67TbEPpb
 t7zHY2ixSbqdRHtyitnXYS1gIEgw5mctMQ==
X-Google-Smtp-Source: AK7set+iDaZfuOtEWrPU9vb29V6cGzy6JRgQs56q/1MPQd0zIFh8CS7KSdZKpquFYB2CBSLH5A+U7w==
X-Received: by 2002:a17:906:a408:b0:878:8073:4915 with SMTP id
 l8-20020a170906a40800b0087880734915mr4534105ejz.15.1674834776949; 
 Fri, 27 Jan 2023 07:52:56 -0800 (PST)
Received: from ?IPV6:2a03:1b20:3:f011::a01d? ([2a03:1b20:3:f011::a01d])
 by smtp.gmail.com with ESMTPSA id
 fp35-20020a1709069e2300b00878683acac3sm2451699ejc.112.2023.01.27.07.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 07:52:56 -0800 (PST)
Message-ID: <e1bc7665-3348-bbb4-58b9-807c1aa96c54@gmail.com>
Date: Fri, 27 Jan 2023 16:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: nouveau@lists.freedesktop.org
From: Shahab Vahedi <shahab.vahedi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:38 +0000
Subject: [Nouveau] Separate TTYs on a Single Dual Head G94 Card
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I have two monitors attached to my G94 graphic card. One is connected
through the HDMI output and the other through DVI. When the kernel
fully boots to its virtual console (getty), both monitors duplicate
the same output. Please see [0] for the log and setup.

I'd like to assign separate TTYs to these monitors. Say tty1 on the
first monitor and tty2 on the second. Is there anyway to do this?

I've done a little bit of research and to me it looks like if I
could end up with two framebuffers (/dev/fb{0,1}) per output, then
maybe there's a chance:

A) pass fbcon=map:01 as kernel parameter
B) or maybe use an old "con2fb.c" [1] program from [2]

Is there anyway, with or without a second framebuffer, to get
these two monitors show separate outputs? If not, given the
current design of nouveau/kernel/libdrm, is it feasible to add
such feature? If yes, I like to work on it as a hobby project
with the community support hopefully [3].

Just to be clear, I'm looking for a solution that doesn't involve
X/Wayland, or adding a second graphic card.

Cheers,
Shahab

[0]
$ dmesg
  ...
  nouveau 0000:01:00.0: vgaarb: deactivate vga console
  Console: switching to colour dummy device 80x25
  nouveau 0000:01:00.0: NVIDIA G94 (094380a1)
  nouveau 0000:01:00.0: bios: version 62.94.6a.00.12
  nouveau 0000:01:00.0: fb: 512 MiB GDDR3
  nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
  nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
  nouveau 0000:01:00.0: DRM: TMDS table version 2.0
  nouveau 0000:01:00.0: DRM: DCB version 4.0
  nouveau 0000:01:00.0: DRM: DCB outp 00: 04000310 00000028
  nouveau 0000:01:00.0: DRM: DCB outp 01: 02011300 00000028
  nouveau 0000:01:00.0: DRM: DCB outp 02: 01011302 00000030
  nouveau 0000:01:00.0: DRM: DCB outp 03: 02022332 00020010
  nouveau 0000:01:00.0: DRM: DCB conn 00: 00000000
  nouveau 0000:01:00.0: DRM: DCB conn 01: 00001130
  nouveau 0000:01:00.0: DRM: DCB conn 02: 00002261
  nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
  nouveau 0000:01:00.0: DRM: allocated 1680x1050 fb: 0x70000, bo 0000000033b61dde
  fbcon: nouveaudrmfb (fb0) is primary device
  Console: switching to colour frame buffer device 210x65
  nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
  [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
  ...

$ ls /dev/fb*
  /dev/fb0

$ cat /proc/fb
  0 nouveaudrmfb

[1]
https://dafyddcrosby.com/dual-framebuffers/con2fb.c

[2]
https://dafyddcrosby.com/dual-framebuffers/

[3]
https://nouveau.freedesktop.org/IntroductoryCourse.html
