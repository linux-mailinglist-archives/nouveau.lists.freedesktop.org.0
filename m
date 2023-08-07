Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB83F772AD4
	for <lists+nouveau@lfdr.de>; Mon,  7 Aug 2023 18:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED9C10E2C7;
	Mon,  7 Aug 2023 16:29:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A459610E2C2
 for <nouveau@lists.freedesktop.org>; Mon,  7 Aug 2023 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8RzhR0Defsn9yPdyrBq2FgdXanmnGOPFDzct4NabJUc=;
 b=aibrFb1CRHTlK1ckDfyoP9sfEvTIHCddAcZb7SYhhm3uXs9ht8gvs870JB11egCtL0hl3j
 BLbCKh8JchkZVn1/pJ9XAfdvYc8g9OQ9QHBjtKnZagmduYDwFmjELzSDQVXpPUhEI8AHt+
 zhreWuO8uzh6GjJlq0WIGALiq2gErwA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-L3j9jBkEMXSRxUlkBHvk1w-1; Mon, 07 Aug 2023 12:29:04 -0400
X-MC-Unique: L3j9jBkEMXSRxUlkBHvk1w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99bfe3dd009so756391666b.0
 for <nouveau@lists.freedesktop.org>; Mon, 07 Aug 2023 09:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425743; x=1692030543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8RzhR0Defsn9yPdyrBq2FgdXanmnGOPFDzct4NabJUc=;
 b=kRGfqCVZDGaeEMTKQWnBe9KMyMXBptmwRVWG58oYfd0anqLlQT+WD3yNkFSZRAjasz
 +CCg4xLlIoryiuNQCJHsiL6kreT6G3U44Tk+gk3mEf268nVQXIlXjEXBDu4w6DcaeOrx
 Ol92CsNHs7XlOehVg8VZxCz7cY2yuecbIg46M0Nf9kG8b0EbDMq/1TVhWGjjMQhqFu4P
 4D4XedBErCbVn7JjI2PxnZSzCvj/zvh8NAQc+TLnMThAaWjTf7twq59YcaYduWDANJk5
 OFwA1H3W3yyx2DqVowkEQftTRc9WKhIz7youbkAFqCSpC/hRl71e7EJsqBq9kvUAnpGS
 P35A==
X-Gm-Message-State: AOJu0YzUo1bqUokI8QUa2UPk7oqH5XE6wKzKBk+DGouF+o79GS/4hntA
 7rQ0oSP5QB2G6g3ZMciTGyIaSgM34M4VyHTzYv7tmXhodh8Jr7k8G53Lp2SComafMfvNejyhoTg
 a1z7KQQWVoYEiJ9CA8PZra1/zUQ==
X-Received: by 2002:a17:907:3f93:b0:99b:cadd:c2ee with SMTP id
 hr19-20020a1709073f9300b0099bcaddc2eemr9291171ejc.29.1691425743723; 
 Mon, 07 Aug 2023 09:29:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw6akvBExQRKLRcc48yHKLdyy5YgC26FFwO36Jpq7vnN3NYThd0gduelCV3L44tmqlcvtGLg==
X-Received: by 2002:a17:907:3f93:b0:99b:cadd:c2ee with SMTP id
 hr19-20020a1709073f9300b0099bcaddc2eemr9291145ejc.29.1691425743314; 
 Mon, 07 Aug 2023 09:29:03 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a1709066d0800b0099cadcf13cesm4504419ejr.66.2023.08.07.09.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:29:02 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Date: Mon,  7 Aug 2023 18:28:44 +0200
Message-ID: <20230807162859.68905-1-dakr@redhat.com>
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

