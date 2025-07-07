Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7397AFB61F
	for <lists+nouveau@lfdr.de>; Mon,  7 Jul 2025 16:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995F910E4AB;
	Mon,  7 Jul 2025 14:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LRfrCjLN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62CC10E4AB
 for <nouveau@lists.freedesktop.org>; Mon,  7 Jul 2025 14:31:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 331C761471;
 Mon,  7 Jul 2025 14:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37708C4CEE3;
 Mon,  7 Jul 2025 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751898714;
 bh=+JQ2/jG6t1FXGniczLJT1oNq8Kdlia0m+017ApoD2Yo=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=LRfrCjLNu2PyESSj5ZCjqWn0QS4/lIfxA18+OxhKEFLeeA5vON2/oUmSMiqCYgXto
 5FcDrTCeuJf5rAdqZZAZw7RjjH0k7S/hEmlw4jAFpzhm19+qiYbh+KR9nYew33JteN
 PrCghMlOhg2MOAeaBfUYq3sCcsvhy9Y1Ua0Nahey5+HZMMFtk9GLfF/Z8C5HUBXn5M
 haD77zGSB0ctxlfwzrKimEpPTeqJgnp9pOCKv8onmIdCVPREAbdOd02HaBWPmDjVaa
 NKtzXN68u9L5Q3v55pV6bjlSvJ8enxQZSag+J1pFbxDkl8e4bTQZYXFea5TYKikfQm
 GnH/0gdyt+8GQ==
Message-ID: <746e66ac-52dd-41e4-a14a-e68594612d97@kernel.org>
Date: Mon, 7 Jul 2025 16:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/gsp: fix potential leak of memory used during
 acpi init
To: Philipp Stanner <pstanner@redhat.com>
References: <20250617040036.2932-1-bskeggs@nvidia.com>
 <45f6e8886b8ddab4aeebf0eab9d07e5ddf7a6704.camel@redhat.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <45f6e8886b8ddab4aeebf0eab9d07e5ddf7a6704.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 7/7/25 10:27 AM, Philipp Stanner wrote:
> On Tue, 2025-06-17 at 14:00 +1000, Ben Skeggs wrote:
>> If any of the ACPI calls fail, memory allocated for the input buffer
>> would be leaked.  Fix failure paths to free allocated memory.
>>
>> Also add checks to ensure the allocations succeeded in the first
>> place.
> 
> If you've got a kmemleak trace, it would also be good to put it here in
> the commit message so that we can distinguish this bug from potential
> other leaks.

unreferenced object 0xffff8ed5029bfb28 (size 8):
   comm "(udev-worker)", pid 464, jiffies 4294672444
   hex dump (first 8 bytes):
     7c b4 d4 79 01 59 36 6c                          |..y.Y6l
   backtrace (crc 4461fdb7):
     __kmalloc_cache_noprof+0x31b/0x410
     r535_gsp_acpi_jt+0x7c/0x110 [nouveau]
     r535_gsp_set_system_info+0x153/0x390 [nouveau]
     r535_gsp_oneinit+0xa4d/0xf50 [nouveau]
     tu102_gsp_oneinit+0x124/0x440 [nouveau]
     nvkm_subdev_oneinit_+0x3f/0x90 [nouveau]
     nvkm_subdev_init_+0x33/0xa0 [nouveau]
     nvkm_subdev_init+0x46/0x60 [nouveau]
     nvkm_device_init+0x167/0x1f0 [nouveau]
     nvkm_udevice_init+0x4b/0x70 [nouveau]
     nvkm_object_init+0x3a/0x110 [nouveau]
     nvkm_ioctl_new+0x13a/0x200 [nouveau]
     nvkm_ioctl+0x9f/0x140 [nouveau]
     nvif_object_ctor+0x11a/0x1a0 [nouveau]
     nvif_device_ctor+0x2a/0x80 [nouveau]
     nouveau_drm_device_new+0x157/0x2e0 [nouveau]
unreferenced object 0xffff8ed502a37580 (size 32):
   comm "(udev-worker)", pid 464, jiffies 4294672444
   hex dump (first 32 bytes):
     01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace (crc f1da05aa):
     __kmalloc_noprof+0x3ac/0x500
     acpi_ut_initialize_buffer+0x67/0xc0
     acpi_evaluate_object+0x272/0x2c0
     acpi_evaluate_dsm+0xb4/0x120
     r535_gsp_acpi_jt+0xa3/0x110 [nouveau]
     r535_gsp_set_system_info+0x153/0x390 [nouveau]
     r535_gsp_oneinit+0xa4d/0xf50 [nouveau]
     tu102_gsp_oneinit+0x124/0x440 [nouveau]
     nvkm_subdev_oneinit_+0x3f/0x90 [nouveau]
     nvkm_subdev_init_+0x33/0xa0 [nouveau]
     nvkm_subdev_init+0x46/0x60 [nouveau]
     nvkm_device_init+0x167/0x1f0 [nouveau]
     nvkm_udevice_init+0x4b/0x70 [nouveau]
     nvkm_object_init+0x3a/0x110 [nouveau]
     nvkm_ioctl_new+0x13a/0x200 [nouveau]
     nvkm_ioctl+0x9f/0x140 [nouveau]
unreferenced object 0xffff8ed5029bf1c0 (size 8):
   comm "(udev-worker)", pid 464, jiffies 4294672446
   hex dump (first 8 bytes):
     cc bb d4 79 01 59 3c 84                          ...y.Y<.
   backtrace (crc 30e1d939):
     __kmalloc_cache_noprof+0x31b/0x410
     r535_gsp_acpi_caps+0x7e/0x120 [nouveau]
     r535_gsp_set_system_info+0x162/0x390 [nouveau]
     r535_gsp_oneinit+0xa4d/0xf50 [nouveau]
     tu102_gsp_oneinit+0x124/0x440 [nouveau]
     nvkm_subdev_oneinit_+0x3f/0x90 [nouveau]
     nvkm_subdev_init_+0x33/0xa0 [nouveau]
     nvkm_subdev_init+0x46/0x60 [nouveau]
     nvkm_device_init+0x167/0x1f0 [nouveau]
     nvkm_udevice_init+0x4b/0x70 [nouveau]
     nvkm_object_init+0x3a/0x110 [nouveau]
     nvkm_ioctl_new+0x13a/0x200 [nouveau]
     nvkm_ioctl+0x9f/0x140 [nouveau]
     nvif_object_ctor+0x11a/0x1a0 [nouveau]
     nvif_device_ctor+0x2a/0x80 [nouveau]
     nouveau_drm_device_new+0x157/0x2e0 [nouveau]

