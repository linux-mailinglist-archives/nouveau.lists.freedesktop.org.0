Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B77E4DC6
	for <lists+nouveau@lfdr.de>; Wed,  8 Nov 2023 01:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE3B10E6D2;
	Wed,  8 Nov 2023 00:13:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26C210E6CE
 for <nouveau@lists.freedesktop.org>; Wed,  8 Nov 2023 00:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699402385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QDPEL4iVJPFZK2iXJb5jKSkwqhK7nY72hfLQyykrdHc=;
 b=PFBpMy8JhRIEPNNG4gGUPgNkVrb8hgggh4P3RMMHX936f/RQw1iID+HtjuDZqw7FqJieyr
 3FfRLRn6rwwSGfSIeSoQfmZbXR2i4zuchNw+atH7AZHxPEg4QAdjtKbJwjQp/wkhlkrWIl
 7GKOoQNUxhY/F+pkLl1zpyfJzA4Onr0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-DDGzExn-M5WDsL6h3ywlGw-1; Tue, 07 Nov 2023 19:13:03 -0500
X-MC-Unique: DDGzExn-M5WDsL6h3ywlGw-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-543d2bc7d9dso4812988a12.1
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 16:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699402383; x=1700007183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QDPEL4iVJPFZK2iXJb5jKSkwqhK7nY72hfLQyykrdHc=;
 b=diu7Y+2AVG/LpHUY6uPSPOppT6rrgW21QtNyFMVmm40xgx8SuswWKCLLMQCozsq/Sq
 Rg9FrcKQpR4T8zU7Wfo9Zi2vQSZQlyz50+oIXw6O+cfpy0XXq1GpCoth6SqhPIPZkVQb
 0HFsyg+5rLMTPz4ENSBhud01zjJ8zO75d1n+pQlKPkHXr4a4n1/znUJjyzF0vvE8ba6t
 yR4vqjlPKOnQQUG1/ajrJyQMdOWPaImLGacbbSmcCVp9k1MXGP9HYlgB9+ui8YDIbQCH
 sNHnd9jQShsOjf4TCXjBrTMKfqSZyyr/xBNtUX2h9Vj4wCkyOy4GVjF0WhEPQ5QNhVgw
 95xg==
X-Gm-Message-State: AOJu0YzyDxbZgsIPdbTkcJZql3zkH+toG1mZRIMkvWyA0LBUtJpiCfig
 nLTnSyjUT0l8sT05aV/n7WSxizYrQH92uO+orJlz5+tzhP/pVkimHwEiMh5G0qfGUHFyPJFMYLL
 /uQ1C3nOAFgDdeztBc070v08CrQ==
X-Received: by 2002:a50:cdcf:0:b0:53f:aa86:e839 with SMTP id
 h15-20020a50cdcf000000b0053faa86e839mr190087edj.30.1699402382753; 
 Tue, 07 Nov 2023 16:13:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEL6L0idg0kOvMQqkRgQQc2bfd7vJZ3kGHvtGHptLQzuKHlUNhsYcL916vBEA8gRc5dnr6WqQ==
X-Received: by 2002:a50:cdcf:0:b0:53f:aa86:e839 with SMTP id
 h15-20020a50cdcf000000b0053faa86e839mr190067edj.30.1699402382420; 
 Tue, 07 Nov 2023 16:13:02 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a5099d7000000b00542db304680sm6030817edb.63.2023.11.07.16.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 16:13:02 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Wed,  8 Nov 2023 01:12:30 +0100
Message-ID: <20231108001259.15123-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-misc-next v9 00/12] [RFC] DRM GPUVM features
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

Changes in V6:
==============
  - add drm_gpuvm_bo::evicted field protected by the drm_gem_object's dma-resv
    lock (Thomas)
    - additionally to the original proposal, always use drm_gpuvm_bo::evicted
      regardless of the used locking scheme and always keep it up to date
  - remove unneccesary get->put dance in drm_gpuva_unlink() (Thomas)
  - fix commit message wording (Thomas)
  - fix kernel doc warnings (kernel test robot)

Changes in V7:
==============
  - add a patch converting WARN() macros to drm_WARN() variants
  - allow drivers to pass the number of fences to reserve and the drm_exec flags
    through struct drm_gpuvm_exec
  - rename 'root' GEM object to 'resv' GEM object
  - fix order of private_usage and extobj_usage in drm_gpuvm_resv_add_fence()
  - always set drm_gpuvm_bo::evicted accordingly
  - explicitly clear drm_gpuvm_bo from evict list after successful validation
  - group reference get() calls with pointer assignments
  - call drm_gem_object_put() after vm_bo_free() callback
  - make lockdep checks explicit for drm_gpuvm_bo_* functions
  - improve documentation of struct drm_gpuvm_bo
  - fix a few documentation typos and style issues
  - use BIT() instead of shift ops for enum drm_gpuvm_flags

Changes in V8:
==============
  - do not always WARN on drm_gpuvm_check_overflow() to avoid userspace being
    able to spam the system log (Christian)
  - fix checkpath warning ENOTSUPP -> EOPNOTSUPP (Thomas)
  - fix another checkpatch error (assignment in if condition) (Thomas)
  - fix missing doc comment regarding a drm_gpuvm_bo's gpuva list (Thomas)
  - reference count struct drm_gpuvm, this avoids having (odd) rules when
    dealing with a drm_gpuvm_bo's gpuvm pointer

Changes in V9:
==============
  - in drm_gpuvm_free() call drm_gpuvm_fini() before checking for
    gpuvm->ops->vm_free
  - fix doc comment of drm_gpuvm_put()
  - fix reference leak in drm_gpuva_insert()
  - document drm_gpuvm_put() may be called from atomic context
  - document drm_gpuvm_bo_put() may only be called from non-atomic context + add
    a might_sleep()

Danilo Krummrich (12):
  drm/gpuvm: convert WARN() to drm_WARN() variants
  drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
  drm/gpuvm: export drm_gpuvm_range_valid()
  drm/nouveau: make use of drm_gpuvm_range_valid()
  drm/gpuvm: add common dma-resv per struct drm_gpuvm
  drm/nouveau: make use of the GPUVM's shared dma-resv
  drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
  drm/nouveau: separately allocate struct nouveau_uvmm
  drm/gpuvm: reference count drm_gpuvm structures
  drm/gpuvm: add an abstraction for a VM / BO combination
  drm/gpuvm: track/lock/validate external/evicted objects
  drm/nouveau: use GPUVM common infrastructure

 drivers/gpu/drm/drm_gpuvm.c             | 1131 +++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c    |   15 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h    |    5 +
 drivers/gpu/drm/nouveau/nouveau_drm.c   |    5 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   10 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  |   57 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h  |    4 -
 drivers/gpu/drm/nouveau/nouveau_gem.c   |   10 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c |    9 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h |    7 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  269 +++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.h  |    8 -
 include/drm/drm_gem.h                   |   32 +-
 include/drm/drm_gpuvm.h                 |  521 ++++++++++-
 14 files changed, 1812 insertions(+), 271 deletions(-)


base-commit: c015fb6d01adb616fb54824feb55ce5ab18e8ca1
-- 
2.41.0

