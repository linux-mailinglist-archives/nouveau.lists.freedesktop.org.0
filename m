Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C208A5E6B6
	for <lists+nouveau@lfdr.de>; Wed, 12 Mar 2025 22:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52B310E7C0;
	Wed, 12 Mar 2025 21:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="b1Bqk/Kj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D77710E7CB
 for <nouveau@lists.freedesktop.org>; Wed, 12 Mar 2025 21:38:07 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-476805acddaso2636901cf.1
 for <nouveau@lists.freedesktop.org>; Wed, 12 Mar 2025 14:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1741815486;
 x=1742420286; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R/2Ej2lVek8nVuDTTI+TLTeHQuhu7UC+Z3eoE2HEgI8=;
 b=b1Bqk/Kj0Ih1aE48aW9j9Zlse/47jTBc1duvXUPO5r1bVLlw3rExIXBQWdPYLaCibm
 IcyYBNdI+SOiYISyNR8l8LWlB/WOqDGNdxhRphwHTOZ+Q6CGYldVezaDbP+WIl1j8/Q+
 V84eHo+PCBAlHLZ4pDfbl7mCQEJ8MTa1QSGhO7i9vU/g2lOFv/6qJUwmEsqXOat4NgJd
 BqPkmkR5EWZJkStx2eRDsmpMRCM4YL0bgxN6B7dKCwSc7hcwWei1sS7DHwdVkwzPOxSz
 1gh05JjgACoi2OvUAAL7QbZLgjANONAtCV+d+2vqHadB2cxrhP7furKH/1ZGPCvdC3wp
 8Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741815486; x=1742420286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R/2Ej2lVek8nVuDTTI+TLTeHQuhu7UC+Z3eoE2HEgI8=;
 b=cMwhCdo8XLQpaHvZKeq1WqxFWyydezMQMHUz1TgQqssmneQKmlRRRCox0FxuV9gR9x
 BCrdTcXgIiK2xJaYdKncSQsZDsq9JOVjLvGGZKP6jGZYLj/GKzbb/SV74iTkXR5fnzWN
 k4wYv4batGK5eE9TxZw4smE08hA1Hpsh2cj8TP0YWJ5wC5s17C1svAIrp7DTQd2/NBRm
 TBNfbSDZvFMvejyg5kXaA+eSMb/hyQ+fOKrht1ZCsJ4aplr3+EGRsj1CPEt4VanthHJf
 lgKwBMpOgF/25tJsRltA5a1RIWFCzRB/bGFrWQhciTWAsHyVo12nFtLJElpmUkH+mtXf
 7ccw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf2ubTQe6cOp4/i5cjVrCLjMdgrUxGNuEHCp8itqxe1uRTuqJSr+yDpwazqHA2AjL6qcTMk1Bm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPdcjPRCCRPvm3G0qD2kk0q0VtMrjw1AN0wCwl+F9ETiFXORQB
 /dcUcEbNDBXicO8TR5iTpn/MeCXfYIHCgtK8ZTTLjm2DH5qu1bti6EvsjP0Kvto=
X-Gm-Gg: ASbGncvFdRvZBB+9FdFXIQ6Ditkm5z8acyps4mVniiQ0mJa024dKr+vHgcwbLuSUOHt
 dBiHIjaZvHdBsasdwF9QDPqMbdmGXWslr8QKD94fYAKHXTBqpbSAxxvtfjroQROd38KXsV7ChkM
 bZdd6nkbhYKe0DCgOO9YiK1fz2dSTp9VX7L477XRSMm4MjcJhynEuY3ZOVKlD6b27JMV3Eba84G
 J2xDpPS4i7ldmtV56VBp89I/7cM1KaR68FxqVuhtK0zvFyKo66l7LhlynyKgg84Tvaaj50hhUOJ
 rUbCDCPpJ0Qo/0qXircgTP2NR2Wi90vZo+6r2Y+cuqnDuL7AWQNYHBkOT5EDK6Aboc9oXDnjP8h
 0tt2bVQThOqVkxQ==
X-Google-Smtp-Source: AGHT+IF6G4EzKdndRN8O8NjSYUCzGbOinYRa2LqaAs2XUCZvktk7yzr1sTqfGcurZA8PcviD7jqP/g==
X-Received: by 2002:a05:622a:47ca:b0:476:9b14:f905 with SMTP id
 d75a77b69052e-4769b150252mr120738921cf.47.1741815486192; 
 Wed, 12 Mar 2025 14:38:06 -0700 (PDT)
Received: from m-kiwi.mynetworksettings.com
 ([2600:4040:9834:3d00:ea98:25f3:a3:e5c5])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47690deda7csm40220361cf.29.2025.03.12.14.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:38:04 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 0/2] drm/nouveau: ZCULL support
Date: Wed, 12 Mar 2025 17:36:13 -0400
Message-ID: <20250312213746.228042-1-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
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

These patches add kernel-side support for using the zcull hardware in nvidia
gpus. Zcull aims to improve memory bandwidth by using an early approximate
depth test, similar to hierarchical Z on an AMD card. These patches add two
new ioctls on nouveau devices, which are currently only supported when using
gsp firmware.

Corresponding userspace changes for NVK are available here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33861
or, if gitlab is down, mirrored here:
https://codeberg.org/mhenning/mesa/commits/branch/zcull3

This series is also available in git:
https://gitlab.freedesktop.org/mhenning/linux/-/commits/zcull2?ref_type=heads

As these are my first kernel patches, I ask for your patience during the
review process.

Mel Henning (2):
  drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
  drm/nouveau: DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER

 drivers/gpu/drm/nouveau/include/nvif/if0020.h |   6 +
 .../drm/nouveau/include/nvkm/core/device.h    |   6 +
 .../gpu/drm/nouveau/include/nvkm/engine/gr.h  |   1 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h | 122 ++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  61 +++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   2 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |   8 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.h   |   2 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   |  26 ++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |  17 +++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c |  34 +++++
 include/uapi/drm/nouveau_drm.h                |  35 +++++
 13 files changed, 322 insertions(+)

-- 
2.48.1

