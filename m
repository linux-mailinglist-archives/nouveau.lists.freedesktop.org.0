Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925287A29E4
	for <lists+nouveau@lfdr.de>; Fri, 15 Sep 2023 23:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFCF10E69B;
	Fri, 15 Sep 2023 21:58:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB37B10E69B
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 21:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694815078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHigS+X/SJoQu8/HuEbi1lgyXVRdtZF3Im9gxkEzjM4=;
 b=BRIFjwuoYn6sghiYuAgDWfNPZbpvgFTeTGFnDsIbwTAG0dDWYFyD6SfaQd/gJ/i9AfBVS7
 huVGNUUyb8fcO0+6DfD+uaxUtSAMZy1Ct6DY4UI0lvDHywCd+BUgo1oNoU3xzQ396XfHHc
 ThKHR7y3cGdVsbFn+qMqkKdcBHUBbTQ=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-S9TBtke1MiyGEPVcYqz2_Q-1; Fri, 15 Sep 2023 17:57:56 -0400
X-MC-Unique: S9TBtke1MiyGEPVcYqz2_Q-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1ad17b9fcd8so4096932fac.0
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 14:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694815075; x=1695419875;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fHigS+X/SJoQu8/HuEbi1lgyXVRdtZF3Im9gxkEzjM4=;
 b=ae9WrwiMQRKMoUBc2x6UsPn9Jxdo+TwOA+Mhsn6GoU+qkrsvsHuNwfK5ENB4JBIQjg
 2hPPMpPiFTIxBIrFcCcS51HVu1okCfXsq/q0qgb+RdGVkn55PTs1M10Z5lyJxqpcP7C8
 nkLTVHfMfGO32IrAUyod+IAWowMjLBDbzn4yhxy+DP66lH8up/6Dg+kR+nH2U7i7EwuR
 lCMuoZeZHZ2JM1XO1BWY3ohVh3qcMR0LTBdJ7pGDY5woCpA1MLiUlbEa4hm/N62I+Qpq
 XzJsILORPOBzCyJRB4iE4WCri6eQ6FlF7khUALeXc2YcXYNhAUxbMcrlzp4JFn6RycxY
 2Kog==
X-Gm-Message-State: AOJu0YzovS+96V8kZ9oNh2HpWbWQY2vRFVZTM6Et4gMlG/68L0keKGZD
 Znq5cWNibS+cpL7KhqC6plBIgFH8AlaIdOeFgAipye84ZXjFQaUeYfAgptoBUjWXT/gnB+k0fLw
 ga4FY72QxDtKL/xZBknT1BcdC3pZ+PEADSg==
X-Received: by 2002:a05:6870:4250:b0:1ba:466d:5f9e with SMTP id
 v16-20020a056870425000b001ba466d5f9emr3093978oac.49.1694815075181; 
 Fri, 15 Sep 2023 14:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCVIDnLPN4gaVj8/TaWSXHje2IT43ahIQcZ0wAqtyhOzEVmQGzIcAaNLfs9FjLF2rmqIuUaw==
X-Received: by 2002:a05:6870:4250:b0:1ba:466d:5f9e with SMTP id
 v16-20020a056870425000b001ba466d5f9emr3093967oac.49.1694815074944; 
 Fri, 15 Sep 2023 14:57:54 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a0cf193000000b0064f364f3584sm1561970qvl.97.2023.09.15.14.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 14:57:54 -0700 (PDT)
Message-ID: <10a6ce00a93bece7fcaab271124cd34cac8f6d10.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
Date: Fri, 15 Sep 2023 17:57:53 -0400
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 00/44] drm/nouveau: display rework to support
 GSP-RM
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Tested on an RTX4000

On Thu, 2023-09-14 at 18:45 +1000, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
>=20
> The primary issue being tackled here is that, for historical reasons (we
> didn't know any better / couldn't make it work reliably otherwise), some
> operations (SOR routing, DP link training) were performed during the 2nd
> HW supervisor interrupt.
>=20
> We don't have control of the display supervisor when running on top of
> RM, so this needed to be untangled and fixed - which, is one of the main
> aims of this patch series.
>=20
> The ordering of this series is pretty important, so take care if/when
> backporting patches from it.
>=20
> Beyond that main goal, various other interfaces have been added or
> extended to provide the information that RM will need for its version of
> similar interfaces.
>=20
> Ben Skeggs (43):
>   drm/nouveau/devinit/tu102-: remove attempt at loading PreOS
>   drm/nouveau/imem: support allocations not preserved across suspend
>   drm/nouveau/gr/gf100-: lose contents of global ctxbufs across suspend
>   drm/nouveau/mmu/gp100-: always invalidate TLBs at CACHE_LEVEL_ALL
>   drm/nouveau/kms/nv50-: fix mst payload alloc fail crashing evo
>   drm/nouveau/disp: rearrange output methods
>   drm/nouveau/disp: add output detect method
>   drm/nouveau/disp: add output method to fetch edid
>   drm/nouveau/disp: rename internal output acquire/release functions
>   drm/nouveau/disp: shuffle to make upcoming diffs prettier
>   drm/nouveau/disp: add acquire_dac()
>   drm/nouveau/disp: add acquire_sor/pior()
>   drm/nouveau/disp: update SOR routing immediately on acquire()
>   drm/nouveau/kms/nv50-: pull some common init out of OR-specific code
>   drm/nouveau/kms/nv50-: remove nv_encoder.audio.connector
>   drm/nouveau/kms/nv50-: keep output state around until modeset complete
>   drm/nouveau/kms/nv50-: move audio enable post-modeset
>   drm/nouveau/disp: add output hdmi config method
>   drm/nouveau/disp: move hdmi disable out of release()
>   drm/nouveau/disp: release outputs post-modeset
>   drm/nouveau/disp: remove SOR routing updates from supervisor
>   drm/nouveau/disp: add output backlight control methods
>   drm/nouveau/disp: add output lvds config method
>   drm/nouveau/disp: add hdmi audio hal function
>   drm/nouveau/disp: move dp aux pwr method to HAL
>   drm/nouveau/disp: add dp aux xfer method
>   drm/nouveau/disp: add dp rates method
>   drm/nouveau/kms/nv50-: split DP disable+enable into two modesets
>   drm/nouveau/kms/nv50-: flush mst disables together
>   drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link
>   drm/nouveau/disp: add dp train method
>   drm/nouveau/disp: move link training out of supervisor
>   drm/nouveau/disp: add support for post-LT adjust
>   drm/nouveau/disp: add dp sst config method
>   drm/nouveau/disp: add dp mst id get/put methods
>   drm/nouveau/disp: move outp/conn construction to chipset code
>   drm/nouveau/disp: move outp init/fini paths to chipset code
>   drm/nouveau/kms/nv50-: create heads based on nvkm head mask
>   drm/nouveau/kms/nv50-: create heads after outps/conns
>   drm/nouveau/kms/nv50-: name aux channels after their connector
>   drm/nouveau/kms/nv50-: create connectors based on nvkm info
>   drm/nouveau/kms/nv50-: create outputs based on nvkm info
>   drm/nouveau/kms/nv50-: disable dcb parsing
>=20
> Lyude Paul (1):
>   drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
>=20
>  drivers/gpu/drm/nouveau/dispnv04/disp.c       |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 512 +++++++++++-------
>  drivers/gpu/drm/nouveau/dispnv50/disp.h       |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/head.h       |   1 +
>  drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  14 +
>  drivers/gpu/drm/nouveau/include/nvif/conn.h   |  20 +-
>  drivers/gpu/drm/nouveau/include/nvif/if0011.h |  21 +-
>  drivers/gpu/drm/nouveau/include/nvif/if0012.h | 249 +++++++--
>  drivers/gpu/drm/nouveau/include/nvif/outp.h   |  96 +++-
>  .../drm/nouveau/include/nvkm/core/memory.h    |   1 +
>  .../drm/nouveau/include/nvkm/subdev/instmem.h |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_backlight.c   |  90 +--
>  drivers/gpu/drm/nouveau/nouveau_bios.c        |   8 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c   | 251 ++++-----
>  drivers/gpu/drm/nouveau/nouveau_connector.h   |   3 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c     |   8 +-
>  drivers/gpu/drm/nouveau/nouveau_dp.c          | 345 ++++++++++--
>  drivers/gpu/drm/nouveau/nouveau_encoder.h     |  30 +-
>  drivers/gpu/drm/nouveau/nvif/conn.c           |  36 +-
>  drivers/gpu/drm/nouveau/nvif/disp.c           |   2 +-
>  drivers/gpu/drm/nouveau/nvif/outp.c           | 412 ++++++++++++--
>  drivers/gpu/drm/nouveau/nvkm/core/memory.c    |  15 +-
>  .../gpu/drm/nouveau/nvkm/engine/disp/base.c   | 146 +----
>  .../gpu/drm/nouveau/nvkm/engine/disp/conn.c   |  10 -
>  .../gpu/drm/nouveau/nvkm/engine/disp/conn.h   |   2 -
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 362 ++++---------
>  .../gpu/drm/nouveau/nvkm/engine/disp/g84.c    |   1 +
>  .../gpu/drm/nouveau/nvkm/engine/disp/g94.c    |   1 +
>  .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |   1 +
>  .../gpu/drm/nouveau/nvkm/engine/disp/gf119.c  |   2 +-
>  .../gpu/drm/nouveau/nvkm/engine/disp/gk104.c  |   1 +
>  .../gpu/drm/nouveau/nvkm/engine/disp/gm107.c  |   1 +
>  .../gpu/drm/nouveau/nvkm/engine/disp/gm200.c  |  17 +-
>  .../gpu/drm/nouveau/nvkm/engine/disp/gp100.c  |   1 +
>  .../gpu/drm/nouveau/nvkm/engine/disp/gt215.c  |  38 ++
>  .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |   2 +-
>  .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  15 +-
>  .../gpu/drm/nouveau/nvkm/engine/disp/mcp89.c  |   1 +
>  .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 182 ++++++-
>  .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   | 144 ++++-
>  .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  43 +-
>  .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |   1 +
>  .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |  67 +--
>  .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 460 +++++++++++++---
>  .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |  10 +-
>  .../drm/nouveau/nvkm/subdev/devinit/tu102.c   |  12 +-
>  .../drm/nouveau/nvkm/subdev/instmem/base.c    |  19 +-
>  .../drm/nouveau/nvkm/subdev/instmem/priv.h    |   1 +
>  .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   2 +-
>  .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |   2 +-
>  50 files changed, 2461 insertions(+), 1207 deletions(-)
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

