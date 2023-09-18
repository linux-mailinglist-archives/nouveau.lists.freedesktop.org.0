Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616E87A5386
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D054310E025;
	Mon, 18 Sep 2023 20:14:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8549E10E025
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:21 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c43166b7e5so32101365ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068060; x=1695672860; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jne3Q+ZVdbE6evoBgRdu8I6aWJTe1/DbhE98c6MrVcs=;
 b=aD1Xw58zybEYOiyNwxqygNkDdyqP5gxtEUq7o2KjLRSLmW6XdREiYKOkiNSLvGGjwb
 8Tr1tCUQDHAt3PXhZkhLV7QCoaXTbIxjmiRCAy/Mh8N1o1rTSlWLmGzdFVMckeddM+RL
 pjk/87FoPrZwEuEZnN1Gupu/gPMyH0tiX3zyCk32Mq73c0vc7kVkfjOwmJe5dRF+iD1z
 kyaANlpC1VjBq93fW0id4EL5+6z1fEijEXz7LITxK/KKVKfZR3GYE5ZEMn80X+ikdfRc
 piwxFTlsJk0XQzgAPez+rv2GeYsJKrdHGfi1sVIOaoKhWKYfe3qiuXISCnQRF0nhLdPR
 5L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068060; x=1695672860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jne3Q+ZVdbE6evoBgRdu8I6aWJTe1/DbhE98c6MrVcs=;
 b=aoQzffGpRD9vss7PS7tVOgH1rOdk7brF962aPHPIeOjzNfbREeFHpk5KBK8JA+p1Vq
 EUeb1U1ORXBbM4RpaxP4WaaEdGM/5HenuPjUPkAEAXoeMilbNRxBYtb65NUgZ1wWWDaJ
 u1NvmPcgjHw/RhB9z1AZpnEJ75Bzqp9txPbqA8TFxz8D/pp0pC/9xH8/eqeLZSmmreLm
 ZH/uRDdnCIqhpqPEDkzJwC9Zrjof3JOywoSQGw+oCSpUniz7iSnTALwXunDtKNQNZ/lI
 Qqk1vDJJBOL2phe0x1BAd2GrlqWj+KhfI/n9TpucWtVk3Omdl9MbyGBH9pVl8c2YFA++
 00Dg==
X-Gm-Message-State: AOJu0Yw4zZMjvTkzEh8RFngRWhOmMksFO+6rtXYttkr+urDvm+OcFR4c
 HqZjU+LG9kLZRb3s6pXUbjUFzVQ+e6A=
X-Google-Smtp-Source: AGHT+IGbcujNItiwukkDDTgqf1lA1kb4PECOLbK4ylW5Kk8Y+D3O4s8O8MbE7B3xLNuVgntxvIzzaQ==
X-Received: by 2002:a17:902:d704:b0:1b8:83a3:7db6 with SMTP id
 w4-20020a170902d70400b001b883a37db6mr10441886ply.44.1695068060487; 
 Mon, 18 Sep 2023 13:14:20 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:19 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:20 +1000
Message-ID: <20230918201404.3765-1-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 00/44] drm/nouveau: display rework to support
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

From: Ben Skeggs <bskeggs@redhat.com>

The primary issue being tackled here is that, for historical reasons (we
didn't know any better / couldn't make it work reliably otherwise), some
operations (SOR routing, DP link training) were performed during the 2nd
HW supervisor interrupt.

We don't have control of the display supervisor when running on top of
RM, so this needed to be untangled and fixed - which, is one of the main
aims of this patch series.

The ordering of this series is pretty important, so take care if/when
backporting patches from it.

Beyond that main goal, various other interfaces have been added or
extended to provide the information that RM will need for its version of
similar interfaces.

Ben Skeggs (43):
  drm/nouveau/devinit/tu102-: remove attempt at loading PreOS
  drm/nouveau/imem: support allocations not preserved across suspend
  drm/nouveau/gr/gf100-: lose contents of global ctxbufs across suspend
  drm/nouveau/mmu/gp100-: always invalidate TLBs at CACHE_LEVEL_ALL
  drm/nouveau/kms/nv50-: fix mst payload alloc fail crashing evo
  drm/nouveau/disp: rearrange output methods
  drm/nouveau/disp: add output detect method
  drm/nouveau/disp: add output method to fetch edid
  drm/nouveau/disp: rename internal output acquire/release functions
  drm/nouveau/disp: shuffle to make upcoming diffs prettier
  drm/nouveau/disp: add acquire_dac()
  drm/nouveau/disp: add acquire_sor/pior()
  drm/nouveau/disp: update SOR routing immediately on acquire()
  drm/nouveau/kms/nv50-: pull some common init out of OR-specific code
  drm/nouveau/kms/nv50-: remove nv_encoder.audio.connector
  drm/nouveau/kms/nv50-: keep output state around until modeset complete
  drm/nouveau/kms/nv50-: move audio enable post-modeset
  drm/nouveau/disp: add output hdmi config method
  drm/nouveau/disp: move hdmi disable out of release()
  drm/nouveau/disp: release outputs post-modeset
  drm/nouveau/disp: remove SOR routing updates from supervisor
  drm/nouveau/disp: add output backlight control methods
  drm/nouveau/disp: add output lvds config method
  drm/nouveau/disp: add hdmi audio hal function
  drm/nouveau/disp: move dp aux pwr method to HAL
  drm/nouveau/disp: add dp aux xfer method
  drm/nouveau/disp: add dp rates method
  drm/nouveau/kms/nv50-: split DP disable+enable into two modesets
  drm/nouveau/kms/nv50-: flush mst disables together
  drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link
  drm/nouveau/disp: add dp train method
  drm/nouveau/disp: move link training out of supervisor
  drm/nouveau/disp: add dp sst config method
  drm/nouveau/disp: add dp mst id get/put methods
  drm/nouveau/disp: move outp/conn construction to chipset code
  drm/nouveau/disp: move outp init/fini paths to chipset code
  drm/nouveau/disp/nv50-: skip DCB_OUTPUT_TV
  drm/nouveau/kms/nv50-: create heads based on nvkm head mask
  drm/nouveau/kms/nv50-: create heads after outps/conns
  drm/nouveau/kms/nv50-: name aux channels after their connector
  drm/nouveau/kms/nv50-: create connectors based on nvkm info
  drm/nouveau/kms/nv50-: create outputs based on nvkm info
  drm/nouveau/kms/nv50-: disable dcb parsing

Lyude Paul (1):
  drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state

 drivers/gpu/drm/nouveau/dispnv04/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 512 +++++++++++-------
 drivers/gpu/drm/nouveau/dispnv50/disp.h       |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/head.h       |   1 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  14 +
 drivers/gpu/drm/nouveau/include/nvif/conn.h   |  20 +-
 drivers/gpu/drm/nouveau/include/nvif/if0011.h |  21 +-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 249 +++++++--
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  96 +++-
 .../drm/nouveau/include/nvkm/core/memory.h    |   1 +
 .../drm/nouveau/include/nvkm/subdev/instmem.h |   2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  90 +--
 drivers/gpu/drm/nouveau/nouveau_bios.c        |   8 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 251 ++++-----
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   3 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   8 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c          | 345 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |  30 +-
 drivers/gpu/drm/nouveau/nvif/conn.c           |  36 +-
 drivers/gpu/drm/nouveau/nvif/disp.c           |   2 +-
 drivers/gpu/drm/nouveau/nvif/outp.c           | 412 ++++++++++++--
 drivers/gpu/drm/nouveau/nvkm/core/memory.c    |  15 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   | 146 +----
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.c   |  10 -
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.h   |   2 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 362 ++++---------
 .../gpu/drm/nouveau/nvkm/engine/disp/g84.c    |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/g94.c    |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gf119.c  |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gk104.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gm107.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gm200.c  |  17 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gp100.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gt215.c  |  38 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  15 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/mcp89.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 182 ++++++-
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   | 144 ++++-
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  43 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |  67 +--
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 460 +++++++++++++---
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |  10 +-
 .../drm/nouveau/nvkm/subdev/devinit/tu102.c   |  12 +-
 .../drm/nouveau/nvkm/subdev/instmem/base.c    |  19 +-
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   2 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |   2 +-
 50 files changed, 2461 insertions(+), 1207 deletions(-)

-- 
2.41.0

