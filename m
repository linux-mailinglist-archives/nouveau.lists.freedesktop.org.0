Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F52A6B671
	for <lists+nouveau@lfdr.de>; Fri, 21 Mar 2025 09:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C113910E700;
	Fri, 21 Mar 2025 08:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VMd5dmP5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740210E700
 for <nouveau@lists.freedesktop.org>; Fri, 21 Mar 2025 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742547412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UmamkrH9aWqRrdGIMj2bjZdzPS6GkGrFSAV+R2UtplI=;
 b=VMd5dmP5Fr+H0miQsPaSPUZEAW4YguSdCjUcKJMJeo2sC7v11fOXO7iKAxIV3OeRcL2kWr
 hv857gWTy7j1C6O1r1PQBsxI2+OPRmQKQDa7A2cJi36m8Dmstk2yksmc/1UzGt2AhIDL1H
 ztNqfNLIxQkVW4nAWx89YczkzYU2+xU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-eG-sxxHnNt6zn_Z-hWIikw-1; Fri, 21 Mar 2025 04:56:50 -0400
X-MC-Unique: eG-sxxHnNt6zn_Z-hWIikw-1
X-Mimecast-MFC-AGG-ID: eG-sxxHnNt6zn_Z-hWIikw_1742547409
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5e82ed0f826so1709013a12.0
 for <nouveau@lists.freedesktop.org>; Fri, 21 Mar 2025 01:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742547408; x=1743152208;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UmamkrH9aWqRrdGIMj2bjZdzPS6GkGrFSAV+R2UtplI=;
 b=RfexzhdcxyGujQUsfC6pKzVjHqnvgXkqYYHDVoVDPShctkBcDLR8qxYPHyOOPYSkFO
 ZNO4QYWBywoCz7tJw6U+zoImwgpfHIsEzYFVtNOx6n4LFKhB6zsrzBQ4N2vwfvZpBWrD
 FzsjPBbIC3tRd9efbS7Ges+s6P238jfb56eYQdLXbtfTfE5qTZr7VYRI2VqrmQes+4//
 KH2/N5jRKnq0xADO41EzJND/XwoLnRYIicR6iiLi/CDnSH+sGqO8Gv9yFI+Y7TsjAlP/
 8rFbK7NuX0yelq1JHdU/Dedi5G6t3PtSQxflKj5sal9CXlKkiSwkNiSw2LRdgB2UGpqm
 JtXA==
X-Gm-Message-State: AOJu0YxzREnW8IVAMQ10cAX23UFUIzQVvp9RI3lwKKeiPpDn4GM/33p3
 p4k5vJsVdTAk4ACQMll+7+Z9v6M92VlzUfRJtvphhzmMx+1qZe43785CuqwIRxdcCAprjj2CZ0Y
 hrNc2mdKSUlDna2WFfBsnxbm9OEy9m2zXqA3kQD4hN2OrmbSgzm1P4VbKEB8nA6ankcYe4ntybR
 z9+Hq9VUtAo492SpekTPEec2CS/mewvPNWxHjQ3HHA7vDuVSsC9w==
X-Gm-Gg: ASbGnct0jz9qedGKw/+jrG0c+63emsSupy+YwtZcqtrWEnrHL2Q/POHjfLpXhDIJgK+
 0l3To95cWNNlPovG6yDJryM5B4k1HR0Ym6w7xeGpV6ZF1fYndwNNk4qWDP47l6Gy402DsMcvLPJ
 pE4Jpyr3L7I7GS3d2vqDav487l2C+al3b+F7RLMcug0kraoTpdgKEkANXRdNu+iaeqyIHeplZtd
 3JbJFbYbDEF8Ti/V1iMETGdqpqUnBbwglbUTJ9SJsfgm/pNVlKfE5ecCd0MQUFKKUpjFMSP45hg
 6S1Iug6CEsE3wG1kH98Ki1wx5pSxrGCXJFwIM41UGvyi3xFzSGuvYe93rmHnK7A=
X-Received: by 2002:a17:907:f50a:b0:ac2:842c:8d04 with SMTP id
 a640c23a62f3a-ac3f2268612mr245368266b.17.1742547408469; 
 Fri, 21 Mar 2025 01:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiswA+CGM5cE3rhzNFaB4WY9oSbnjAoh6bLgiGR+ZeFe2hNMSb6u2AqTO09DBakZDovsG6xw==
X-Received: by 2002:a17:907:f50a:b0:ac2:842c:8d04 with SMTP id
 a640c23a62f3a-ac3f2268612mr245366066b.17.1742547408075; 
 Fri, 21 Mar 2025 01:56:48 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3dca:bd00:51bc:c81:8518:71f4?
 ([2001:16b8:3dca:bd00:51bc:c81:8518:71f4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb51e74sm110759566b.115.2025.03.21.01.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 01:56:47 -0700 (PDT)
Message-ID: <277b0834cd051113e531172b8228e3e69bedd980.camel@redhat.com>
Subject: Memory leaks from r535_gsp_oneinit()
From: Philipp Stanner <pstanner@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: dakr@kernel.org, lyude@redhat.com
Date: Fri, 21 Mar 2025 09:56:46 +0100
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: acDDYeLJq7vIWngfjNY4d4yCNOykYFF-8vItWW3omeg_1742547409
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

I see two small memory leaks on a Fedora 41 desktop with a custom built
kernel @ commit:

27d4815149ba drm/sched: Group exported prototypes by object type

GPU is an RTX 5000 Ada

The leaks are there immediately after booting the machine. They don't
seem to reoccur, although I have not verified this very strictly.


cat /sys/kernel/debug/kmemleak=20
unreferenced object 0xff11000102304380 (size 8):
  comm "kworker/0:2", pid 222, jiffies 4294714878
  hex dump (first 8 bytes):
    00 00 00 00 00 00 00 00                          ........
  backtrace (crc 0):
    __kmalloc_cache_noprof+0x355/0x450
    r535_gsp_oneinit+0x48e2/0x8bc0 [nouveau]
    nvkm_subdev_oneinit_+0x10c/0x230 [nouveau]
    nvkm_subdev_init_+0x86/0x1f0 [nouveau]
    nvkm_subdev_init+0xa4/0xc0 [nouveau]
    nvkm_device_init+0x347/0x530 [nouveau]
    nvkm_udevice_init+0x8e/0xe0 [nouveau]
    nvkm_object_init+0xc6/0x3f0 [nouveau]
    nvkm_ioctl_new+0x383/0x6f0 [nouveau]
    nvkm_ioctl+0x239/0x4f0 [nouveau]
    nvif_object_ctor+0x3db/0x740 [nouveau]
    nvif_device_ctor+0x32/0x100 [nouveau]
    nouveau_drm_device_new+0x3c9/0xa50 [nouveau]
    nouveau_drm_probe+0x119/0x440 [nouveau]
    local_pci_probe+0xdc/0x180
    work_for_cpu_fn+0x52/0xa0
unreferenced object 0xff11000102304aa0 (size 8):
  comm "kworker/0:2", pid 222, jiffies 4294714878
  hex dump (first 8 bytes):
    00 00 00 00 00 00 00 00                          ........
  backtrace (crc 0):
    __kmalloc_cache_noprof+0x355/0x450
    r535_gsp_oneinit+0x4bdf/0x8bc0 [nouveau]
    nvkm_subdev_oneinit_+0x10c/0x230 [nouveau]
    nvkm_subdev_init_+0x86/0x1f0 [nouveau]
    nvkm_subdev_init+0xa4/0xc0 [nouveau]
    nvkm_device_init+0x347/0x530 [nouveau]
    nvkm_udevice_init+0x8e/0xe0 [nouveau]
    nvkm_object_init+0xc6/0x3f0 [nouveau]
    nvkm_ioctl_new+0x383/0x6f0 [nouveau]
    nvkm_ioctl+0x239/0x4f0 [nouveau]
    nvif_object_ctor+0x3db/0x740 [nouveau]
    nvif_device_ctor+0x32/0x100 [nouveau]
    nouveau_drm_device_new+0x3c9/0xa50 [nouveau]
    nouveau_drm_probe+0x119/0x440 [nouveau]
    local_pci_probe+0xdc/0x180
    work_for_cpu_fn+0x52/0xa0

