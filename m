Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3226772AE6
	for <lists+nouveau@lfdr.de>; Mon,  7 Aug 2023 18:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E4410E2BD;
	Mon,  7 Aug 2023 16:32:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D60A10E2BD
 for <nouveau@lists.freedesktop.org>; Mon,  7 Aug 2023 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8RzhR0Defsn9yPdyrBq2FgdXanmnGOPFDzct4NabJUc=;
 b=C+/CyL6DWmJ97DvzadNxN/4lkkgbk7hRr9Zj4E1hmAdSuzbgFhJXbaLPqoRQZ2II9WaIxO
 m7EasRiv0PRVjFn8teXb4HaZDs0Hwr6jVAu/kIjrxLNAiwJ3dMHwqe7XqJDB4SKPAWQHCP
 AIO/QqAOj/nbEn1Ej8k7nPDvDK/qhUo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-G9zx51BRPriq_-UDhQyZcA-1; Mon, 07 Aug 2023 12:32:44 -0400
X-MC-Unique: G9zx51BRPriq_-UDhQyZcA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fe0e1dfdbaso4476622e87.1
 for <nouveau@lists.freedesktop.org>; Mon, 07 Aug 2023 09:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425962; x=1692030762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8RzhR0Defsn9yPdyrBq2FgdXanmnGOPFDzct4NabJUc=;
 b=e0KiqgRd6sog07Ie8u0UUlvuDsZhTE502rESeowZamMPGY6uGfUw/LC1zycLSMCbER
 Vind4krw4R3ZFCacVomSZ1UPx4FZx27b8ASSA20EIo3doV0tLrhIktQOgKeSHSsCeNsX
 j5akOi5d4O+zvco06/4lcVfscyx9dwmTLw6mVmAbOfzw2Ty8WqsQNINIB4dTy1c3LEki
 GM0eF4uJisG+yE0rhUamssNBHGTd+Pnju5Os+HKnaFVKlxxSyiwrLFla+v6aZwYvetLn
 MFELYigb3DDUhVO8zjbMzSbt9Q9pZkqpxCPTzO/D+jBl6XcE503MM7va2WHbwc20eodK
 zyIQ==
X-Gm-Message-State: AOJu0Yx31f8trrKLIWTbL6oxWW9Kvaej3wF2FqalAvadbxHe7ylLXgnU
 ewi96Olb7Rw8qaguEZnj0Twyb3M7JboTGVRbxD7ywuC3Y1+A9GAu5MdvXeIqv50os7WY3O+Ajka
 2knqPwjaqzl5naQAaAB3Efkpgug==
X-Received: by 2002:ac2:5e90:0:b0:4fb:c657:3376 with SMTP id
 b16-20020ac25e90000000b004fbc6573376mr5710684lfq.29.1691425962408; 
 Mon, 07 Aug 2023 09:32:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoveHUcxmtOtYeVGuvV0X+WYxTBKr9SEAQjhSbownwD6MHWzDQxtVUZ5WIVK3lj030C9Zegw==
X-Received: by 2002:ac2:5e90:0:b0:4fb:c657:3376 with SMTP id
 b16-20020ac25e90000000b004fbc6573376mr5710669lfq.29.1691425962042; 
 Mon, 07 Aug 2023 09:32:42 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a50fb11000000b00522572f323dsm5394761edq.16.2023.08.07.09.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:32:41 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Date: Mon,  7 Aug 2023 18:32:21 +0200
Message-ID: <20230807163238.2091-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next 0/5] Nouveau VM_BIND uAPI Fixes
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The patch series provides a few fixes for the recently merged VM_BIND uAPI
mostly addressing a couple of warnings.

It also contains one patch to slightly reduce the memory footprint of
struct nouveau_uvma.

Danilo Krummrich (5):
  nouveau/dmem: fix copy-paste error in nouveau_dmem_migrate_chunk()
  drm/nouveau: nvkm: vmm: silence warning from cast
  drm/nouveau: remove incorrect __user annotations
  drm/nouveau: uvmm: remove incorrect calls to mas_unlock()
  drm/nouveau: uvmm: remove dedicated VM pointer from VMAs

 drivers/gpu/drm/nouveau/nouveau_dmem.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |  6 ++---
 drivers/gpu/drm/nouveau/nouveau_exec.h        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 23 ++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        | 14 +++++------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  5 ++--
 6 files changed, 24 insertions(+), 28 deletions(-)


base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
-- 
2.41.0

