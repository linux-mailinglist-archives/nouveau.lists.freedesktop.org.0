Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7887A53DB
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DC510E308;
	Mon, 18 Sep 2023 20:21:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F70E10E308
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695068493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fEHkg+rzkhKMiB85JslvQjQ5TqDC3k6/hky37LI6dxs=;
 b=KCApSiKXeH4nyG1YRIXeXr1gt5Ld4cZsU9gV8w+z54veatOOJzzDg6GCrU4UebMlTlQPxH
 Tk6fjUnHea6w67jcV7diUon9a/1y8Rvm3EbA7HatiLLYOwAdYttVUV/8PH6/w0LPyR3d+D
 WQe/oiw3344LxS1aQswKKOx86yMyjVI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-JR0FwXGAN22Yr92xT2cQXA-1; Mon, 18 Sep 2023 16:21:31 -0400
X-MC-Unique: JR0FwXGAN22Yr92xT2cQXA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a34d3e5ebso318363166b.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068490; x=1695673290;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fEHkg+rzkhKMiB85JslvQjQ5TqDC3k6/hky37LI6dxs=;
 b=L7tZrD7MaO3aP+rhIsJuQVClNugvWI5tky7blm0CDYGuBd/RsaLkSxQrzSxE1RSiGp
 7XGl0SAtCqNBC6GA/YXVUJs/9ZvGI2SY1ee2drI0v1th6xhX8Fh/EjCNtZQhfxs4yg79
 siktDnkBv/RwJGJOp1i3KTT7z60rWFJzV6cbpq+dJJrG1x0D4+Vne2m4q1zr+YJ5oDQz
 bMhTuCfw5aSSEx2dsqWt2BvTQYXs/W1FDTJ4CLbwYcRqZsXFp6O9z/9zqTbRV6W5fmpC
 0HYfycww15hhy8yZivyH37MjMJ1OD2Yvel2KAswtErYNlA3JHMLtlI/9UyXX/44KNVJa
 LwYw==
X-Gm-Message-State: AOJu0Yz6X6jNu8q+AQ4PCXCHPbJZX8b+2OYZB11UbaZBKnfXUwA0Smlj
 vKf3U2kbbk84/kosR532OEBAr14NruPSvlrPSNIL1mqNyXnbnoS8zO7+R80UdhFC58Ozx3cjouU
 nkPmE/0MLrhEEe9zipTFAQjzpjA==
X-Received: by 2002:a17:906:308b:b0:9a9:e393:8bcd with SMTP id
 11-20020a170906308b00b009a9e3938bcdmr7221611ejv.5.1695068490696; 
 Mon, 18 Sep 2023 13:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELoaa9dN6hdTq+Q7Qxzmx77lib2OLc6BE9eOTZyEexZlU9XSFK5C/FGggCC93d0lMbxgmz0Q==
X-Received: by 2002:a17:906:308b:b0:9a9:e393:8bcd with SMTP id
 11-20020a170906308b00b009a9e3938bcdmr7221604ejv.5.1695068490381; 
 Mon, 18 Sep 2023 13:21:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a170906561300b009a16975ee5asm6857341ejq.169.2023.09.18.13.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 13:21:30 -0700 (PDT)
Message-ID: <24b24b28-2780-72ba-f05d-44bb88c9acfd@redhat.com>
Date: Mon, 18 Sep 2023 22:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
References: <20230918201404.3765-1-skeggsb@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 00/44] drm/nouveau: display rework to
 support GSP-RM
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

On 9/18/23 22:13, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
> 
> The primary issue being tackled here is that, for historical reasons (we
> didn't know any better / couldn't make it work reliably otherwise), some
> operations (SOR routing, DP link training) were performed during the 2nd
> HW supervisor interrupt.
> 
> We don't have control of the display supervisor when running on top of
> RM, so this needed to be untangled and fixed - which, is one of the main
> aims of this patch series.
> 
> The ordering of this series is pretty important, so take care if/when
> backporting patches from it.
> 
> Beyond that main goal, various other interfaces have been added or
> extended to provide the information that RM will need for its version of
> similar interfaces.
> 

For the series:

Acked-by: Danilo Krummrich <dakr@redhat.com>

> Ben Skeggs (43):
>    drm/nouveau/devinit/tu102-: remove attempt at loading PreOS
>    drm/nouveau/imem: support allocations not preserved across suspend
>    drm/nouveau/gr/gf100-: lose contents of global ctxbufs across suspend
>    drm/nouveau/mmu/gp100-: always invalidate TLBs at CACHE_LEVEL_ALL
>    drm/nouveau/kms/nv50-: fix mst payload alloc fail crashing evo
>    drm/nouveau/disp: rearrange output methods
>    drm/nouveau/disp: add output detect method
>    drm/nouveau/disp: add output method to fetch edid
>    drm/nouveau/disp: rename internal output acquire/release functions
>    drm/nouveau/disp: shuffle to make upcoming diffs prettier
>    drm/nouveau/disp: add acquire_dac()
>    drm/nouveau/disp: add acquire_sor/pior()
>    drm/nouveau/disp: update SOR routing immediately on acquire()
>    drm/nouveau/kms/nv50-: pull some common init out of OR-specific code
>    drm/nouveau/kms/nv50-: remove nv_encoder.audio.connector
>    drm/nouveau/kms/nv50-: keep output state around until modeset complete
>    drm/nouveau/kms/nv50-: move audio enable post-modeset
>    drm/nouveau/disp: add output hdmi config method
>    drm/nouveau/disp: move hdmi disable out of release()
>    drm/nouveau/disp: release outputs post-modeset
>    drm/nouveau/disp: remove SOR routing updates from supervisor
>    drm/nouveau/disp: add output backlight control methods
>    drm/nouveau/disp: add output lvds config method
>    drm/nouveau/disp: add hdmi audio hal function
>    drm/nouveau/disp: move dp aux pwr method to HAL
>    drm/nouveau/disp: add dp aux xfer method
>    drm/nouveau/disp: add dp rates method
>    drm/nouveau/kms/nv50-: split DP disable+enable into two modesets
>    drm/nouveau/kms/nv50-: flush mst disables together
>    drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link
>    drm/nouveau/disp: add dp train method
>    drm/nouveau/disp: move link training out of supervisor
>    drm/nouveau/disp: add dp sst config method
>    drm/nouveau/disp: add dp mst id get/put methods
>    drm/nouveau/disp: move outp/conn construction to chipset code
>    drm/nouveau/disp: move outp init/fini paths to chipset code
>    drm/nouveau/disp/nv50-: skip DCB_OUTPUT_TV
>    drm/nouveau/kms/nv50-: create heads based on nvkm head mask
>    drm/nouveau/kms/nv50-: create heads after outps/conns
>    drm/nouveau/kms/nv50-: name aux channels after their connector
>    drm/nouveau/kms/nv50-: create connectors based on nvkm info
>    drm/nouveau/kms/nv50-: create outputs based on nvkm info
>    drm/nouveau/kms/nv50-: disable dcb parsing
> 
> Lyude Paul (1):
>    drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
> 
>   drivers/gpu/drm/nouveau/dispnv04/disp.c       |   2 +-
>   drivers/gpu/drm/nouveau/dispnv50/disp.c       | 512 +++++++++++-------
>   drivers/gpu/drm/nouveau/dispnv50/disp.h       |   6 +-
>   drivers/gpu/drm/nouveau/dispnv50/head.h       |   1 +
>   drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  14 +
>   drivers/gpu/drm/nouveau/include/nvif/conn.h   |  20 +-
>   drivers/gpu/drm/nouveau/include/nvif/if0011.h |  21 +-
>   drivers/gpu/drm/nouveau/include/nvif/if0012.h | 249 +++++++--
>   drivers/gpu/drm/nouveau/include/nvif/outp.h   |  96 +++-
>   .../drm/nouveau/include/nvkm/core/memory.h    |   1 +
>   .../drm/nouveau/include/nvkm/subdev/instmem.h |   2 +-
>   drivers/gpu/drm/nouveau/nouveau_backlight.c   |  90 +--
>   drivers/gpu/drm/nouveau/nouveau_bios.c        |   8 +-
>   drivers/gpu/drm/nouveau/nouveau_connector.c   | 251 ++++-----
>   drivers/gpu/drm/nouveau/nouveau_connector.h   |   3 +-
>   drivers/gpu/drm/nouveau/nouveau_display.c     |   8 +-
>   drivers/gpu/drm/nouveau/nouveau_dp.c          | 345 ++++++++++--
>   drivers/gpu/drm/nouveau/nouveau_encoder.h     |  30 +-
>   drivers/gpu/drm/nouveau/nvif/conn.c           |  36 +-
>   drivers/gpu/drm/nouveau/nvif/disp.c           |   2 +-
>   drivers/gpu/drm/nouveau/nvif/outp.c           | 412 ++++++++++++--
>   drivers/gpu/drm/nouveau/nvkm/core/memory.c    |  15 +-
>   .../gpu/drm/nouveau/nvkm/engine/disp/base.c   | 146 +----
>   .../gpu/drm/nouveau/nvkm/engine/disp/conn.c   |  10 -
>   .../gpu/drm/nouveau/nvkm/engine/disp/conn.h   |   2 -
>   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 362 ++++---------
>   .../gpu/drm/nouveau/nvkm/engine/disp/g84.c    |   1 +
>   .../gpu/drm/nouveau/nvkm/engine/disp/g94.c    |   1 +
>   .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |   1 +
>   .../gpu/drm/nouveau/nvkm/engine/disp/gf119.c  |   2 +-
>   .../gpu/drm/nouveau/nvkm/engine/disp/gk104.c  |   1 +
>   .../gpu/drm/nouveau/nvkm/engine/disp/gm107.c  |   1 +
>   .../gpu/drm/nouveau/nvkm/engine/disp/gm200.c  |  17 +-
>   .../gpu/drm/nouveau/nvkm/engine/disp/gp100.c  |   1 +
>   .../gpu/drm/nouveau/nvkm/engine/disp/gt215.c  |  38 ++
>   .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |   2 +-
>   .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  15 +-
>   .../gpu/drm/nouveau/nvkm/engine/disp/mcp89.c  |   1 +
>   .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 182 ++++++-
>   .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   | 144 ++++-
>   .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  43 +-
>   .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |   1 +
>   .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |  67 +--
>   .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 460 +++++++++++++---
>   .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |  10 +-
>   .../drm/nouveau/nvkm/subdev/devinit/tu102.c   |  12 +-
>   .../drm/nouveau/nvkm/subdev/instmem/base.c    |  19 +-
>   .../drm/nouveau/nvkm/subdev/instmem/priv.h    |   1 +
>   .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   2 +-
>   .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |   2 +-
>   50 files changed, 2461 insertions(+), 1207 deletions(-)
> 

