Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6DAFE36B
	for <lists+nouveau@lfdr.de>; Wed,  9 Jul 2025 11:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE3410E769;
	Wed,  9 Jul 2025 09:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UpDnC/qx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F254310E769
 for <nouveau@lists.freedesktop.org>; Wed,  9 Jul 2025 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752051718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0FJM4/Tfd75UrGvO2OE4uWSucFV6TgveyisdRB+Bk4=;
 b=UpDnC/qxARIwv36FhavC3jvCpdIEP/p3bxcthAmOdogsfAEvwEHGebVn9Ho7+9envc8C2+
 fgBgj6SqbdzyCSzzbo+Mxn/p/qOzEtdy1LyUAIvvg8ihqXzvLpwkps2pFer0F0XySFdSi4
 8h2qsV1NyPGmiSCDnq4Ndk6sW4yiDBw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-Rj-Elj6OP1Gf6HgfG6jS9w-1; Wed, 09 Jul 2025 05:01:56 -0400
X-MC-Unique: Rj-Elj6OP1Gf6HgfG6jS9w-1
X-Mimecast-MFC-AGG-ID: Rj-Elj6OP1Gf6HgfG6jS9w_1752051715
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a5058f9ef4so2165149f8f.2
 for <nouveau@lists.freedesktop.org>; Wed, 09 Jul 2025 02:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752051715; x=1752656515;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z0FJM4/Tfd75UrGvO2OE4uWSucFV6TgveyisdRB+Bk4=;
 b=vwosqZjCwOn4/lqADHVVycBaVAE9PGK2IR3Tqg3nRI+LMMV6TzwJJ5lhkE14pB75Po
 qXcjDHt2fSAv0Z58lWR9/OsKOzRap1GNsEaY1FaKkdV3rx1mTt8Z/28Z0uDIKZ/uyIKZ
 Do8Oe5bSqNNXjlQ/ANbN7UDIA+XPaDU1UvUzhbrhl0FnX1yrwtp8NwWH5xWflYdAR9t4
 mrAcfo6dZTaL6FVY23xchNXr4wsPrGX94fdb7gUVzW5DfQqXMm3Jg88MKD94xfVcoz4g
 fdx28tPplOHt2ejctcdInzvhpwJwuCO5vbqRuFZg9JXklaspbtv7hXqnQyICLbOzzzWF
 QkNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKPOu0jtBsYyekaXC7szmGZXsMifiqfYQiR504bmO85T/G43LL2M6UyT0n9IQP/GG5C1DUZ0hP@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yymtp+2pHHQbUAq53AIBXsEsOnWsof/cL5gCr19uRxtwz6J6TVc
 GgiHFgNK8RNjt4ZHnSycaRW7DZtYg+Z6MDLzikM7VTnC73ER/9AbFz7Nun579VKnUN21hWiQbyD
 mmdriV5xWk9APZPpeD1hResvrjYnQfyn/I2/m/5ohIdnUsVSS6JCSeTVcPlraCCuF/Og=
X-Gm-Gg: ASbGncvW6aiLr/yfUX0dQYzMDNcA/kKe1TsqOWLDGcLPJpaS1DMa6PBOf1L+wFveDwC
 qcIXyvFElYwT/bL7IK9uQCBhpbIL1ljvpzJMZaGCxIvZo9lW0KBnhUc1n2H+ER28VDCBNAcWxCT
 /P2I0cMBzU1hghx5eFcBuuoHPqlAnCG6mTYt6rkdG9SRE+uSKdgQCjrvs7hoOWKSu76Ult0Lr7k
 suHPijn0ombcXth8syOW9iIqgICyJXKkR7oiVoGacLrNltNo5t6eR1LQIQAQ3EJ2fUIWET8YQpB
 Tzu2CPKqVHdJq0wlvMWVikHCz+jyA8Qn3Q9NG8VyeujtA/yZ
X-Received: by 2002:a05:6000:989:b0:3b4:9b82:d432 with SMTP id
 ffacd0b85a97d-3b5e4449aa9mr1319096f8f.0.1752051715141; 
 Wed, 09 Jul 2025 02:01:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEfP1PUNkZoTr4mETbUS8bWNLBvpVngpZjukjV5a4IgYQW0FZViVjxIoG0Ut40+ZJMMRhZrg==
X-Received: by 2002:a05:6000:989:b0:3b4:9b82:d432 with SMTP id
 ffacd0b85a97d-3b5e4449aa9mr1319053f8f.0.1752051714670; 
 Wed, 09 Jul 2025 02:01:54 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a755sm15342285f8f.78.2025.07.09.02.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 02:01:54 -0700 (PDT)
Message-ID: <8b24720e5bc0fff61f7095ed9551a8a37ec03ebe.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/gsp: fix potential leak of memory used
 during acpi init
From: Philipp Stanner <pstanner@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Date: Wed, 09 Jul 2025 11:01:53 +0200
In-Reply-To: <746e66ac-52dd-41e4-a14a-e68594612d97@kernel.org>
References: <20250617040036.2932-1-bskeggs@nvidia.com>
 <45f6e8886b8ddab4aeebf0eab9d07e5ddf7a6704.camel@redhat.com>
 <746e66ac-52dd-41e4-a14a-e68594612d97@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EYgqgtyU_iBIDJF0F5sYwxglli13zs5aXj8HIK963OA_1752051715
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 2025-07-07 at 16:31 +0200, Danilo Krummrich wrote:
> On 7/7/25 10:27 AM, Philipp Stanner wrote:
> > On Tue, 2025-06-17 at 14:00 +1000, Ben Skeggs wrote:
> > > If any of the ACPI calls fail, memory allocated for the input buffer
> > > would be leaked.=C2=A0 Fix failure paths to free allocated memory.
> > >=20
> > > Also add checks to ensure the allocations succeeded in the first
> > > place.
> >=20
> > If you've got a kmemleak trace, it would also be good to put it here in
> > the commit message so that we can distinguish this bug from potential
> > other leaks.
>=20
> unreferenced object 0xffff8ed5029bfb28 (size 8):
> =C2=A0=C2=A0 comm "(udev-worker)", pid 464, jiffies 4294672444
> =C2=A0=C2=A0 hex dump (first 8 bytes):
> =C2=A0=C2=A0=C2=A0=C2=A0 7c b4 d4 79 01 59 36 6c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |..y.Y6l
> =C2=A0=C2=A0 backtrace (crc 4461fdb7):
> =C2=A0=C2=A0=C2=A0=C2=A0 __kmalloc_cache_noprof+0x31b/0x410
> =C2=A0=C2=A0=C2=A0=C2=A0 r535_gsp_acpi_jt+0x7c/0x110 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 r535_gsp_set_system_info+0x153/0x390 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 r535_gsp_oneinit+0xa4d/0xf50 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 tu102_gsp_oneinit+0x124/0x440 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_subdev_oneinit_+0x3f/0x90 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_subdev_init_+0x33/0xa0 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_subdev_init+0x46/0x60 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_device_init+0x167/0x1f0 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_udevice_init+0x4b/0x70 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_object_init+0x3a/0x110 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_ioctl_new+0x13a/0x200 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_ioctl+0x9f/0x140 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvif_object_ctor+0x11a/0x1a0 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvif_device_ctor+0x2a/0x80 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nouveau_drm_device_new+0x157/0x2e0 [nouveau]
> unreferenced object 0xffff8ed502a37580 (size 32):
> =C2=A0=C2=A0 comm "(udev-worker)", pid 464, jiffies 4294672444
> =C2=A0=C2=A0 hex dump (first 32 bytes):
> =C2=A0=C2=A0=C2=A0=C2=A0 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
=C2=A0 ................
> =C2=A0=C2=A0=C2=A0=C2=A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
=C2=A0 ................
> =C2=A0=C2=A0 backtrace (crc f1da05aa):
> =C2=A0=C2=A0=C2=A0=C2=A0 __kmalloc_noprof+0x3ac/0x500
> =C2=A0=C2=A0=C2=A0=C2=A0 acpi_ut_initialize_buffer+0x67/0xc0
> =C2=A0=C2=A0=C2=A0=C2=A0 acpi_evaluate_object+0x272/0x2c0
> =C2=A0=C2=A0=C2=A0=C2=A0 acpi_evaluate_dsm+0xb4/0x120
> =C2=A0=C2=A0=C2=A0=C2=A0 r535_gsp_acpi_jt+0xa3/0x110 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 r535_gsp_set_system_info+0x153/0x390 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 r535_gsp_oneinit+0xa4d/0xf50 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 tu102_gsp_oneinit+0x124/0x440 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_subdev_oneinit_+0x3f/0x90 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_subdev_init_+0x33/0xa0 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_subdev_init+0x46/0x60 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_device_init+0x167/0x1f0 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_udevice_init+0x4b/0x70 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_object_init+0x3a/0x110 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_ioctl_new+0x13a/0x200 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_ioctl+0x9f/0x140 [nouveau]
> unreferenced object 0xffff8ed5029bf1c0 (size 8):
> =C2=A0=C2=A0 comm "(udev-worker)", pid 464, jiffies 4294672446
> =C2=A0=C2=A0 hex dump (first 8 bytes):
> =C2=A0=C2=A0=C2=A0=C2=A0 cc bb d4 79 01 59 3c 84=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...y.Y<.
> =C2=A0=C2=A0 backtrace (crc 30e1d939):
> =C2=A0=C2=A0=C2=A0=C2=A0 __kmalloc_cache_noprof+0x31b/0x410
> =C2=A0=C2=A0=C2=A0=C2=A0 r535_gsp_acpi_caps+0x7e/0x120 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 r535_gsp_set_system_info+0x162/0x390 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 r535_gsp_oneinit+0xa4d/0xf50 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 tu102_gsp_oneinit+0x124/0x440 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_subdev_oneinit_+0x3f/0x90 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_subdev_init_+0x33/0xa0 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_subdev_init+0x46/0x60 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_device_init+0x167/0x1f0 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_udevice_init+0x4b/0x70 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_object_init+0x3a/0x110 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_ioctl_new+0x13a/0x200 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvkm_ioctl+0x9f/0x140 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvif_object_ctor+0x11a/0x1a0 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nvif_device_ctor+0x2a/0x80 [nouveau]
> =C2=A0=C2=A0=C2=A0=C2=A0 nouveau_drm_device_new+0x157/0x2e0 [nouveau]
>=20

Hm, interesting. That's not the memory leak we have observed. I've got
this trace for leaks of similar size:

unreferenced object 0xff110001518f9348 (size 8):
  comm "kworker/0:4", pid 141, jiffies 4294719397
  hex dump (first 8 bytes):
    98 93 36 c3 c1 b9 80 3e                          ..6....>
  backtrace (crc a04f7c42):
    kmalloc_trace+0x28a/0x380
    r535_gsp_rpc_set_system_info+0x7e8/0x17f0 [nouveau]
    r535_gsp_oneinit+0x1ab0/0x2820 [nouveau]
    nvkm_subdev_oneinit_.part.0+0x91/0x1a0 [nouveau]
    nvkm_subdev_init_+0xfe/0x2b0 [nouveau]
    nvkm_subdev_init+0xa7/0xc0 [nouveau]
    nvkm_device_init+0x347/0x540 [nouveau]
    nvkm_udevice_init+0x97/0xf0 [nouveau]
    nvkm_object_init+0xc3/0x3e0 [nouveau]
    nvkm_ioctl_new+0x36c/0x6b0 [nouveau]
    nvkm_ioctl+0x1c0/0x4a0 [nouveau]
    nvif_object_ctor+0x3c9/0x740 [nouveau]
    nvif_device_ctor+0x2e/0x100 [nouveau]
    nouveau_drm_device_new+0x367/0x910 [nouveau]
    nouveau_drm_probe+0x10c/0x450 [nouveau]
    local_pci_probe+0xe8/0x1a0
unreferenced object 0xff11000142e1bf50 (size 8):
  comm "kworker/0:4", pid 141, jiffies 4294719397
  hex dump (first 8 bytes):
    88 b2 58 d0 d2 d7 ac 26                          ..X....&
  backtrace (crc 8a38119a):
    kmalloc_trace+0x28a/0x380
    r535_gsp_rpc_set_system_info+0xa8f/0x17f0 [nouveau]
    r535_gsp_oneinit+0x1ab0/0x2820 [nouveau]
    nvkm_subdev_oneinit_.part.0+0x91/0x1a0 [nouveau]
    nvkm_subdev_init_+0xfe/0x2b0 [nouveau]
    nvkm_subdev_init+0xa7/0xc0 [nouveau]
    nvkm_device_init+0x347/0x540 [nouveau]
    nvkm_udevice_init+0x97/0xf0 [nouveau]
    nvkm_object_init+0xc3/0x3e0 [nouveau]
    nvkm_ioctl_new+0x36c/0x6b0 [nouveau]
    nvkm_ioctl+0x1c0/0x4a0 [nouveau]
    nvif_object_ctor+0x3c9/0x740 [nouveau]
    nvif_device_ctor+0x2e/0x100 [nouveau]
    nouveau_drm_device_new+0x367/0x910 [nouveau]
    nouveau_drm_probe+0x10c/0x450 [nouveau]


Ben, could those be related?


P.

