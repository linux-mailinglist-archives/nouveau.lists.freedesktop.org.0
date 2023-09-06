Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A379454F
	for <lists+nouveau@lfdr.de>; Wed,  6 Sep 2023 23:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320A510E1F9;
	Wed,  6 Sep 2023 21:47:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A418210E1C4
 for <nouveau@lists.freedesktop.org>; Wed,  6 Sep 2023 21:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694036851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zKkDRQ9/TqnOPU7efxBBUYLuwd+HL60A99HNBdJUd98=;
 b=bbZstlTRPXsfdbFYjq35bRUAJk7YedSQeJwgrNYl1fj14aitX8D4pvAkkBqU0OW5z5xrxM
 6We0JU2Q7iUz4f7P77B0uMNI/00SOknuj3sEUlsQzuXZt/J+0YHgDBKM3QF5hTIrE5KekO
 ExZIx/MygPbUjJFD2wgVFp8pWxmhW0s=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-wAAx4vyXMDqjlNeKVjUAkA-1; Wed, 06 Sep 2023 17:47:28 -0400
X-MC-Unique: wAAx4vyXMDqjlNeKVjUAkA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5009796123dso218781e87.1
 for <nouveau@lists.freedesktop.org>; Wed, 06 Sep 2023 14:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694036847; x=1694641647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zKkDRQ9/TqnOPU7efxBBUYLuwd+HL60A99HNBdJUd98=;
 b=Rs8Ohty6zvoQlN/fJs5g+D5lksihq8KNmyqzHmpRhY6XdQ+Cw4hul5CFIqDPxKrMhF
 TiZEy1TepRe4PEuiKe+CfaRPV/QKmYvOkmZisBS3eR0mQwL31qhKVMFVv+Dxf+5i6Rtz
 ycVmNU8r2z7s5GOfYbBTNLME+NPQK5A/HWYJZpmZDQCDKbNdh/W1vlXmUJiJ4eEsRfr8
 wTJedEo39fOZa4ncZqPmi/o4hGtdQ1Z2Cez4b6iNJIIkbBZRLB45zpQ3pcn6TqoxZIJC
 gh8RoHDxWDYVyVpnOCnrI+vYvxWBMOmWlk+O0AvNQmef/UDsWkj2jFw+r/peKjp6QrRm
 UKRw==
X-Gm-Message-State: AOJu0YyB0C041RsC/+Cap1F4zhUEswMMHrBKXWVP9x3QpmNsMobvNzOy
 i96i/65FuXA5RsIuLdP9XtxIUMGM9dJRbl1C8XhEPgVrBiJksy6+PjC67i/JSqsESzZO6NCgqMr
 zF1MkBaQvIcKjUyvBPvAS0lb8qA==
X-Received: by 2002:a19:ae13:0:b0:500:a60d:c677 with SMTP id
 f19-20020a19ae13000000b00500a60dc677mr3146460lfc.59.1694036847281; 
 Wed, 06 Sep 2023 14:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9vM+HT6JkjFoqnC/5RjtvOildvqPi8k26Fej4Xzn37uwseyzw2k36M3RWZJ5OAgm98jkLTQ==
X-Received: by 2002:a19:ae13:0:b0:500:a60d:c677 with SMTP id
 f19-20020a19ae13000000b00500a60dc677mr3146446lfc.59.1694036846940; 
 Wed, 06 Sep 2023 14:47:26 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a170906c28a00b0099297782aa9sm9446856ejz.49.2023.09.06.14.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 14:47:26 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Date: Wed,  6 Sep 2023 23:47:08 +0200
Message-ID: <20230906214723.4393-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-misc-next v2 0/7] [RFC] DRM GPUVA Manager
 GPU-VM features
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

So far the DRM GPUVA manager offers common infrastructure to track GPU VA
allocations and mappings, generically connect GPU VA mappings to their
backing buffers and perform more complex mapping operations on the GPU VA
space.

However, there are more design patterns commonly used by drivers, which
can potentially be generalized in order to make the DRM GPUVA manager
represent a basic GPU-VM implementation. In this context, this patch series
aims at generalizing the following elements.

1) Provide a common dma-resv for GEM objects not being used outside of
   this GPU-VM.

2) Provide tracking of external GEM objects (GEM objects which are
   shared with other GPU-VMs).

3) Provide functions to efficiently lock all GEM objects dma-resv the
   GPU-VM contains mappings of.

4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
   of, such that validation of evicted GEM objects is accelerated.

5) Provide some convinience functions for common patterns.

The implementation introduces struct drm_gpuvm_bo, which serves as abstraction
combining a struct drm_gpuvm and struct drm_gem_object, similar to what
amdgpu does with struct amdgpu_bo_vm. While this adds a bit of complexity it
improves the efficiency of tracking external and evicted GEM objects.

This patch series also renames struct drm_gpuva_manager to struct drm_gpuvm
including corresponding functions. This way the GPUVA manager's structures align
better with the documentation of VM_BIND [1] and VM_BIND locking [2]. It also
provides a better foundation for the naming of data structures and functions
introduced for implementing the features of this patch series.

Rather than being designed as a "framework", the target is to make all
features appear as a collection of optional helper functions, such that
drivers are free to make use of the DRM GPUVA managers basic
functionality and opt-in for other features without setting any feature
flags, just by making use of the corresponding functions.

This patch series is also available at [3].

[1] Documentation/gpu/drm-vm-bind-async.rst
[2] Documentation/gpu/drm-vm-bind-locking.rst
[3] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/gpuvm-next

Changes in V2:
==============
  - rename 'drm_gpuva_manager' -> 'drm_gpuvm' which generally leads to more
    consistent naming
  - properly separate commits (introduce common dma-resv, drm_gpuvm_bo
    abstraction, etc.)
  - remove maple tree for tracking external objects, use a list drm_gpuvm_bos
    per drm_gpuvm instead
  - rework dma-resv locking helpers (Thomas)
  - add a locking helper for a given range of the VA space (Christian)
  - make the GPUVA manager buildable as module, rather than drm_exec
    builtin (Christian)

Danilo Krummrich (7):
  drm: gpuva_mgr: allow building as module
  drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm
  drm/nouveau: uvmm: rename 'umgr' to 'base'
  drm/gpuvm: common dma-resv per struct drm_gpuvm
  drm/gpuvm: add an abstraction for a VM / BO combination
  drm/gpuvm: generalize dma_resv/extobj handling and GEM validation
  drm/nouveau: GPUVM dma-resv/extobj handling, GEM validation

 drivers/gpu/drm/Kconfig                   |   7 +
 drivers/gpu/drm/Makefile                  |   2 +-
 drivers/gpu/drm/drm_debugfs.c             |  14 +-
 drivers/gpu/drm/drm_gpuva_mgr.c           | 900 +++++++++++++++++-----
 drivers/gpu/drm/nouveau/Kconfig           |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c      |   4 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c |   2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c    |  52 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h    |   4 -
 drivers/gpu/drm/nouveau/nouveau_gem.c     |   4 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h   |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c    | 216 ++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.h    |   6 +-
 include/drm/drm_debugfs.h                 |   4 +-
 include/drm/drm_gem.h                     |  48 +-
 include/drm/drm_gpuva_mgr.h               | 512 ++++++++++--
 16 files changed, 1375 insertions(+), 405 deletions(-)


base-commit: 6bd3d8da51ca1ec97c724016466606aec7739b9f
-- 
2.41.0

