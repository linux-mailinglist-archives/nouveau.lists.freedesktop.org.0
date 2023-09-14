Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52A79FEBB
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C152010E51F;
	Thu, 14 Sep 2023 08:47:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DE310E51F
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:46:59 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68fb898ab3bso525529b3a.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681219; x=1695286019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ROfGSABF7EvotAljE7qK703bag6MxtAYz/YFS9ISUrw=;
 b=ebLC+jY+K4qX0okoxNyPibb5g+HoPP244A5Hy1MLZwCClsKBTHbh/OdhUyUBZxdcVb
 goo/bF6Am5wJ0B1CBhPzYM1ACUGQ8MS0YlaH4CaJoSRAb3QzZMySLISgbvhqFKxBH2WH
 xtw89I++pdmXLNy6FrbTt+iKLEGZ6EXagfBSSqLUaK23V6r3bPj9SXAfV9URvRAsk3I0
 K5q1gkoOzfLKrT98GpXfjpIf6uaWnvBBiglCvZH0e+HlBnU9vg6awJnPy+DOwm3Nuc2k
 Vsv8DCQhu3etT2Cc0JqHy+v6Ubeneyk7YLrBjmUtLpfrQvIcCSVn2L/olSw+oKXEgVBN
 mdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681219; x=1695286019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ROfGSABF7EvotAljE7qK703bag6MxtAYz/YFS9ISUrw=;
 b=SFFVMsCAhXZia92tatPpyFGwhv411yRRF8XF4hIJ4bvDORMN72uR+qGqlHtq4sW2cm
 KqrtWPNMMNrRZCbz7vkTINSN9FWk2Y2RlDlFSMS3kiyQF9KnT0dyZI0hvGGNJNM2vVwH
 hINzce8ibFpogUu+OtrTYXesaXEsJBRitb19wmYrRvHc/YUuuCihR52A6hWJg68XUWHZ
 t5J8tcf8jr31gm12pfx+cs2ewrbaAOVTt9ZXD5e1C1ioacqSkb0dCIEbkPHGCqve219/
 3Q4wgt2XoqP0U89FpEMrXsq77wPKSRxhg/CyaXemrYHuyTEuPud93KFfgzVY/k90J6Vo
 zxJQ==
X-Gm-Message-State: AOJu0YyxRGBhTCNArFRm+debsGQGerJTdhm/e3/08gjQ9F5naRTXXcrq
 NmZHuLIogGGxKEPl0Sq+t7mh2S6t37s=
X-Google-Smtp-Source: AGHT+IEbTJSf0fLb3wrEzDIW7VzS4tqNscqRWm58z+OuUHXp6Us8Ed3YgCsDlsWbOuszlPE3DpXW2g==
X-Received: by 2002:aa7:8888:0:b0:68f:cc47:fcd4 with SMTP id
 z8-20020aa78888000000b0068fcc47fcd4mr6092047pfe.15.1694681218573; 
 Thu, 14 Sep 2023 01:46:58 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:46:57 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:41 +1000
Message-ID: <20230914084624.2299765-2-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 00/44] drm/nouveau: display rework to support
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
  drm/nouveau/disp: add support for post-LT adjust
  drm/nouveau/disp: add dp sst config method
  drm/nouveau/disp: add dp mst id get/put methods
  drm/nouveau/disp: move outp/conn construction to chipset code
  drm/nouveau/disp: move outp init/fini paths to chipset code
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

