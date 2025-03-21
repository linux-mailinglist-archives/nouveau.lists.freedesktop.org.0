Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6BA6B6CA
	for <lists+nouveau@lfdr.de>; Fri, 21 Mar 2025 10:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0633010E715;
	Fri, 21 Mar 2025 09:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SsQl/djJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE6D10E715
 for <nouveau@lists.freedesktop.org>; Fri, 21 Mar 2025 09:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742548532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJUZpXnNiSoNmvWbjSH9aD7FyNXlJW1MDrC3oJm3Scc=;
 b=SsQl/djJKnUxJnBQPbFkAbCgQ4b1Rn/Mfhe0a1pv9UPXAHlDzakxcUTRXwo7QMB1N64IZM
 2f9EjSA3O0R0LU5HpII1sE5r2AcT+0tU+12lmB6r0NhFsv+tgk1JgtB2wcMgiAS8L+YN9i
 atRfw8Yr9/0vJ9Qq43jXDRW0oMFQ9aw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-n7B6QCzIOSiK6vxAXdtZKw-1; Fri, 21 Mar 2025 05:15:30 -0400
X-MC-Unique: n7B6QCzIOSiK6vxAXdtZKw-1
X-Mimecast-MFC-AGG-ID: n7B6QCzIOSiK6vxAXdtZKw_1742548529
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ac21697a8ebso160591566b.1
 for <nouveau@lists.freedesktop.org>; Fri, 21 Mar 2025 02:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742548529; x=1743153329;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tsBuaVflR/l1iNzBKmORG55t81VlKufHs2rQaCUDWHU=;
 b=PApnhbUbkcjKYEKklYOHGwpJwLb2EelIHEtMD8Xnei4UjGPrM4/E4EEx3eVI0FuzTM
 h0BXCG9a2tSkL9rnp3OOaGXmVroZDseTTQnig7F71k/tY1Owqd7KiL5Qz3UCIssCTIRa
 oTUMnYKrGvTh7iYqtN5vvXgF55LzFuTssyHPRdPVk1Tnu+jxcjg2a76LDlX8y59kHKzd
 a8MDc7cMQRzMiH695/WyEXWHGUa64lsKWgtCGM/GwMNhSZWn4oYwlC3R18yEm4M5/P+F
 /uw6mR1/tuqC3nmtXLMGPsOaKonlb+2cgm1UYuF5B7s5Aa/Iaxs1JDWFIKpwfXtuJ3l5
 FQww==
X-Gm-Message-State: AOJu0YwEkXDMMoX/r5fL17HtT+pToCDyJjorR4iwYoDXMHsrTdPX/6Cx
 cxL+PuX4lp4jlNab7giIqRC13cnCg30c9rxsq8gC9Y454wiqW0hgIzQAb5oVmr4G2NwG181WcF1
 dYleUtd1PF7yBgrtDbHItR+GNPhWsAz0wa2drSIzvbVMt5N0tJeCyO+ZuHrFq9aajPdHeS+Qp6t
 RBtChnBEDfgexW4CxcSxJLW0OJbNkQrmjFKqXWpCgnssQ6kvo4/Q==
X-Gm-Gg: ASbGncsfGBrQxU3ZEXcHl3WnaHZiJdFpf2fh9g6168+LJuHRmm63kZTggTIKPnsTpxj
 axBbtA/c9863cGPZDJeCJ/kat9ppb/7+FJyhHPFKijOFvLxoI2JLADtYkxZCvF3fHvFbyiauxEb
 C23wCMg3axZ+K8K3w82nu0Ji1kVLmdCeWqnF5H8naucWMfB9CLRc84QuGiWfz4U2E2oILV+4qu8
 tcpIrVBD1NlTYDOEhtsG/gPBAxrqWoMupst6ME3H9ggtNf99roqex59seRU2UEinpWBSyokC5R9
 Hc/+dnghNeNHd4J2axe/Aw9If5dtWkeVSqlJKvNXLjaT1GceSkdBbvJJdaM3FDQ=
X-Received: by 2002:a17:907:2ce6:b0:ac2:b086:88ec with SMTP id
 a640c23a62f3a-ac3f2089ff7mr242967966b.5.1742548529087; 
 Fri, 21 Mar 2025 02:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrbB+RSfW2cKzM33csj4FNBSWfFYhgAz9bPmZBvfm4jjyZu1jQC+KTb4TeqOEDjxdjiMG4BA==
X-Received: by 2002:a17:907:2ce6:b0:ac2:b086:88ec with SMTP id
 a640c23a62f3a-ac3f2089ff7mr242963266b.5.1742548528480; 
 Fri, 21 Mar 2025 02:15:28 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3dca:bd00:51bc:c81:8518:71f4?
 ([2001:16b8:3dca:bd00:51bc:c81:8518:71f4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb52bffsm113698766b.89.2025.03.21.02.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 02:15:28 -0700 (PDT)
Message-ID: <4f587313b9527de879b1402580e03baf778003b6.camel@redhat.com>
Subject: Re: Memory leaks from r535_gsp_oneinit()
From: Philipp Stanner <pstanner@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: dakr@kernel.org, lyude@redhat.com
Date: Fri, 21 Mar 2025 10:15:27 +0100
In-Reply-To: <277b0834cd051113e531172b8228e3e69bedd980.camel@redhat.com>
References: <277b0834cd051113e531172b8228e3e69bedd980.camel@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ical0oUwH4Krm2HuSZQw62LipxL3FiZcwWCfe5URwzk_1742548529
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

On Fri, 2025-03-21 at 09:56 +0100, Philipp Stanner wrote:
> I see two small memory leaks on a Fedora 41 desktop with a custom
> built
> kernel @ commit:
>=20
> 27d4815149ba drm/sched: Group exported prototypes by object type
>=20
> GPU is an RTX 5000 Ada
>=20
> The leaks are there immediately after booting the machine. They don't
> seem to reoccur, although I have not verified this very strictly.
>=20
>=20
> cat /sys/kernel/debug/kmemleak=20
> unreferenced object 0xff11000102304380 (size 8):
> =C2=A0 comm "kworker/0:2", pid 222, jiffies 4294714878
> =C2=A0 hex dump (first 8 bytes):
> =C2=A0=C2=A0=C2=A0 00 00 00 00 00 00 00 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ........
> =C2=A0 backtrace (crc 0):
> =C2=A0=C2=A0=C2=A0 __kmalloc_cache_noprof+0x355/0x450
> =C2=A0=C2=A0=C2=A0 r535_gsp_oneinit+0x48e2/0x8bc0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_subdev_oneinit_+0x10c/0x230 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_subdev_init_+0x86/0x1f0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_subdev_init+0xa4/0xc0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_device_init+0x347/0x530 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_udevice_init+0x8e/0xe0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_object_init+0xc6/0x3f0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_ioctl_new+0x383/0x6f0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_ioctl+0x239/0x4f0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvif_object_ctor+0x3db/0x740 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvif_device_ctor+0x32/0x100 [nouveau]
> =C2=A0=C2=A0=C2=A0 nouveau_drm_device_new+0x3c9/0xa50 [nouveau]
> =C2=A0=C2=A0=C2=A0 nouveau_drm_probe+0x119/0x440 [nouveau]
> =C2=A0=C2=A0=C2=A0 local_pci_probe+0xdc/0x180
> =C2=A0=C2=A0=C2=A0 work_for_cpu_fn+0x52/0xa0
> unreferenced object 0xff11000102304aa0 (size 8):
> =C2=A0 comm "kworker/0:2", pid 222, jiffies 4294714878
> =C2=A0 hex dump (first 8 bytes):
> =C2=A0=C2=A0=C2=A0 00 00 00 00 00 00 00 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ........
> =C2=A0 backtrace (crc 0):
> =C2=A0=C2=A0=C2=A0 __kmalloc_cache_noprof+0x355/0x450
> =C2=A0=C2=A0=C2=A0 r535_gsp_oneinit+0x4bdf/0x8bc0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_subdev_oneinit_+0x10c/0x230 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_subdev_init_+0x86/0x1f0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_subdev_init+0xa4/0xc0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_device_init+0x347/0x530 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_udevice_init+0x8e/0xe0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_object_init+0xc6/0x3f0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_ioctl_new+0x383/0x6f0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvkm_ioctl+0x239/0x4f0 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvif_object_ctor+0x3db/0x740 [nouveau]
> =C2=A0=C2=A0=C2=A0 nvif_device_ctor+0x32/0x100 [nouveau]
> =C2=A0=C2=A0=C2=A0 nouveau_drm_device_new+0x3c9/0xa50 [nouveau]
> =C2=A0=C2=A0=C2=A0 nouveau_drm_probe+0x119/0x440 [nouveau]
> =C2=A0=C2=A0=C2=A0 local_pci_probe+0xdc/0x180
> =C2=A0=C2=A0=C2=A0 work_for_cpu_fn+0x52/0xa0
>=20

I probably should have provided the decoded stacktrace, shouldn't I.
Here we go:

backtrace (crc 0):
__kmalloc_cache_noprof (/home/imperator/linux/./include/linux/kmemleak.h:43=
 /home/imperator/linux/mm/slub.c:4119 /home/imperator/linux/mm/slub.c:4164 =
/home/imperator/linux/mm/slub.c:4320)=20
r535_gsp_oneinit (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/subdev=
/gsp/r535.c:1743 /home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/subdev/=
gsp/r535.c:1868 /home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/subdev/g=
sp/r535.c:1894 /home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/subdev/gs=
p/r535.c:3316) nouveau=20
nvkm_subdev_oneinit_ (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/co=
re/subdev.c:112) nouveau=20
nvkm_subdev_init_ (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/=
subdev.c:139) nouveau=20
nvkm_subdev_init (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/s=
ubdev.c:169) nouveau=20
nvkm_device_init (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/engine=
/device/base.c:2960) nouveau=20
nvkm_udevice_init (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/engin=
e/device/user.c:247) nouveau=20
nvkm_object_init (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/o=
bject.c:197) nouveau=20
nvkm_ioctl_new (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/ioc=
tl.c:135) nouveau=20
nvkm_ioctl (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c=
:278 (discriminator 1) /home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/c=
ore/ioctl.c:300 (discriminator 1)) nouveau=20
nvif_object_ctor (/home/imperator/linux/drivers/gpu/drm/nouveau/nvif/object=
.c:46 /home/imperator/linux/drivers/gpu/drm/nouveau/nvif/object.c:269) nouv=
eau=20
nvif_device_ctor (/home/imperator/linux/drivers/gpu/drm/nouveau/nvif/device=
.c:61) nouveau=20
nouveau_drm_device_new (/home/imperator/linux/drivers/gpu/drm/nouveau/nouve=
au_drm.c:761) nouveau=20
nouveau_drm_probe (/home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_dr=
m.c:879) nouveau=20
local_pci_probe (/home/imperator/linux/drivers/pci/pci-driver.c:324)=20
work_for_cpu_fn (/home/imperator/linux/kernel/workqueue.c:6731)=20
unreferenced object 0xff11000102304aa0 (size 8):
comm "kworker/0:2", pid 222, jiffies 4294714878
hex dump (first 8 bytes):
00 00 00 00 00 00 00 00                          ........

backtrace (crc 0):
__kmalloc_cache_noprof (/home/imperator/linux/./include/linux/kmemleak.h:43=
 /home/imperator/linux/mm/slub.c:4119 /home/imperator/linux/mm/slub.c:4164 =
/home/imperator/linux/mm/slub.c:4320)=20
r535_gsp_oneinit (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/subdev=
/gsp/r535.c:1708 /home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/subdev/=
gsp/r535.c:1869 /home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/subdev/g=
sp/r535.c:1894 /home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/subdev/gs=
p/r535.c:3316) nouveau=20
nvkm_subdev_oneinit_ (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/co=
re/subdev.c:112) nouveau=20
nvkm_subdev_init_ (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/=
subdev.c:139) nouveau=20
nvkm_subdev_init (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/s=
ubdev.c:169) nouveau=20
nvkm_device_init (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/engine=
/device/base.c:2960) nouveau=20
nvkm_udevice_init (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/engin=
e/device/user.c:247) nouveau=20
nvkm_object_init (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/o=
bject.c:197) nouveau=20
nvkm_ioctl_new (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/ioc=
tl.c:135) nouveau=20
nvkm_ioctl (/home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c=
:278 (discriminator 1) /home/imperator/linux/drivers/gpu/drm/nouveau/nvkm/c=
ore/ioctl.c:300 (discriminator 1)) nouveau=20
nvif_object_ctor (/home/imperator/linux/drivers/gpu/drm/nouveau/nvif/object=
.c:46 /home/imperator/linux/drivers/gpu/drm/nouveau/nvif/object.c:269) nouv=
eau=20
nvif_device_ctor (/home/imperator/linux/drivers/gpu/drm/nouveau/nvif/device=
.c:61) nouveau=20
nouveau_drm_device_new (/home/imperator/linux/drivers/gpu/drm/nouveau/nouve=
au_drm.c:761) nouveau=20
nouveau_drm_probe (/home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_dr=
m.c:879) nouveau=20
local_pci_probe (/home/imperator/linux/drivers/pci/pci-driver.c:324)=20
work_for_cpu_fn (/home/imperator/linux/kernel/workqueue.c:6731)=20


r535.c:3316 seems to be:

=09ret =3D r535_gsp_rpc_set_system_info(gsp);
=09if (WARN_ON(ret))
=09=09return ret;

