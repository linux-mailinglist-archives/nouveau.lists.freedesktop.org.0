Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D795E7B25C9
	for <lists+nouveau@lfdr.de>; Thu, 28 Sep 2023 21:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D602D10E072;
	Thu, 28 Sep 2023 19:16:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058D510E072
 for <nouveau@lists.freedesktop.org>; Thu, 28 Sep 2023 19:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695928590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=23hYikUdaRtGRVcpuaZcOKkjmtKH+z+s0tfM+DCpReY=;
 b=ElTuOGA9z3enKtr2/LDhcnHKZk8OeZNJWvd9n8oAwD/TIS5bf0sffQrbkgWZ/Iyy5v0NIJ
 7Ydn0VQNmf6cDeS362xcshkbS9wSc44y5+dIxyikyW5TTP/61OH6DqodOWPx7xkX3B5/eU
 dGrZYhsiyuN2kodg+onUbwohqIeLc1g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-sgc8WxQuPDOjbtlrNvUE1w-1; Thu, 28 Sep 2023 15:16:29 -0400
X-MC-Unique: sgc8WxQuPDOjbtlrNvUE1w-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9b2cf504e3aso15384766b.2
 for <nouveau@lists.freedesktop.org>; Thu, 28 Sep 2023 12:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695928588; x=1696533388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23hYikUdaRtGRVcpuaZcOKkjmtKH+z+s0tfM+DCpReY=;
 b=vdCbW63ljc04TrJZ/eYGwfmk9BU7qGGbK88cxJDMfXAYRb8GYOzqJdqXdddkJO2SoU
 N6dQZC6vohbsafdtLOuDfpKNrfbYqFCZi309s6R7D/nLXkwGsNq/tts4NtlyT4BvsqzH
 DOh+hvNokrOKClTdI/whzq+MCiE0izXbfaRh2HzAGJEqVfB3TbhOxVM1ygULu1JxoUkR
 xeWwKxUA0H2tarE9n7LwO3bCOcjcu7GVA88atB2FSADTvFlRPK7o+5XaLLMjOMP/Nkui
 Inamj1C02ojsYmUfETnszprQBXNIL8tuKCTUFzakhNlS+L495iDMUpHJuyPmU0qNJFa6
 v3bA==
X-Gm-Message-State: AOJu0Yzdu2WPW/KcZsZKr4cBoWv+RvSFnzGVYLqoXfYNgMmNLMqAqTZJ
 p6szcrfMNPwX3qWX9FCzEDf9eMBDAnvEoz85XNU5tDUrIaSbW/RPEXNKCqe4ytWbwUYdtAwfCWx
 JDi/MD1thusa5vOTu9GsMIjJldA==
X-Received: by 2002:a17:906:7494:b0:9b2:8323:d916 with SMTP id
 e20-20020a170906749400b009b28323d916mr1849419ejl.17.1695928588289; 
 Thu, 28 Sep 2023 12:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcc7rpRWbFx8dTtTXWIuL3BtbBej/D3KE1229rLnvopnKPsf54bJU+nNKXQeP7SwQjHIpBww==
X-Received: by 2002:a17:906:7494:b0:9b2:8323:d916 with SMTP id
 e20-20020a170906749400b009b28323d916mr1849392ejl.17.1695928587868; 
 Thu, 28 Sep 2023 12:16:27 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a1709061b1a00b0099bc08862b6sm11446090ejg.171.2023.09.28.12.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 12:16:27 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Thu, 28 Sep 2023 21:16:14 +0200
Message-ID: <20230928191624.13703-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-misc-next v5 0/6] [RFC] DRM GPUVM features
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

Currently GPUVM offers common infrastructure to track GPU VA allocations
and mappings, generically connect GPU VA mappings to their backing
buffers and perform more complex mapping operations on the GPU VA space.

However, there are more design patterns commonly used by drivers, which
can potentially be generalized in order to make GPUVM represent the
basis of a VM implementation. In this context, this patch series aims at
generalizing the following elements.

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

This patch series is also available at [3].

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/gpuvm-next

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

Changes in V3:
==============
  - rename missing function and files (Boris)
  - warn if vm_obj->obj != obj in drm_gpuva_link() (Boris)
  - don't expose drm_gpuvm_bo_destroy() (Boris)
  - unlink VM_BO from GEM in drm_gpuvm_bo_destroy() rather than
    drm_gpuva_unlink() and link within drm_gpuvm_bo_obtain() to keep
    drm_gpuvm_bo instances unique
  - add internal locking to external and evicted object lists to support drivers
    updating the VA space from within the fence signalling critical path (Boris)
  - unlink external objects and evicted objects from the GPUVM's list in
    drm_gpuvm_bo_destroy()
  - add more documentation and fix some kernel doc issues

Changes in V4:
==============
  - add a drm_gpuvm_resv() helper (Boris)
  - add a drm_gpuvm::<list_name>::local_list field (Boris)
  - remove drm_gpuvm_bo_get_unless_zero() helper (Boris)
  - fix missing NULL assignment in get_next_vm_bo_from_list() (Boris)
  - keep a drm_gem_object reference on potential vm_bo destroy (alternatively we
    could free the vm_bo and drop the vm_bo's drm_gem_object reference through
    async work)
  - introduce DRM_GPUVM_RESV_PROTECTED flag to indicate external locking through
    the corresponding dma-resv locks to optimize for drivers already holding
    them when needed; add the corresponding lock_assert_held() calls (Thomas)
  - make drm_gpuvm_bo_evict() per vm_bo and add a drm_gpuvm_bo_gem_evict()
    helper (Thomas)
  - pass a drm_gpuvm_bo in drm_gpuvm_ops::vm_bo_validate() (Thomas)
  - documentation fixes

Changes in V5:
==============
  - use a root drm_gem_object provided by the driver as a base for the VM's
    common dma-resv (Christian)
  - provide a helper to allocate a "dummy" root GEM object in case a driver
    specific root GEM object isn't available
  - add a dedicated patch for nouveau to make use of the GPUVM's shared dma-resv
  - improve documentation (Boris)
  - the following patches are removed from the series, since they already landed
    in drm-misc-next
    - f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
    - fe7acaa727e1 ("drm/gpuvm: allow building as module")
    - 78f54469b871 ("drm/nouveau: uvmm: rename 'umgr' to 'base'")

Danilo Krummrich (6):
  drm/gpuvm: add common dma-resv per struct drm_gpuvm
  drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
  drm/gpuvm: add an abstraction for a VM / BO combination
  drm/gpuvm: track/lock/validate external/evicted objects
  drm/nouveau: make use of the GPUVM's shared dma-resv
  drm/nouveau: use GPUVM common infrastructure

 drivers/gpu/drm/drm_gpuvm.c             | 1036 +++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c    |   15 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h    |    5 +
 drivers/gpu/drm/nouveau/nouveau_exec.c  |   52 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h  |    4 -
 drivers/gpu/drm/nouveau/nouveau_gem.c   |   10 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h |    4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  183 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.h  |    1 -
 include/drm/drm_gem.h                   |   32 +-
 include/drm/drm_gpuvm.h                 |  465 +++++++++-
 11 files changed, 1625 insertions(+), 182 deletions(-)


base-commit: a4ead6e37e3290cff399e2598d75e98777b69b37
-- 
2.41.0

