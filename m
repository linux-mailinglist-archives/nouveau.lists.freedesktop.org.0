Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E77A875A
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 16:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD5310E4F7;
	Wed, 20 Sep 2023 14:43:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03A910E4F9
 for <nouveau@lists.freedesktop.org>; Wed, 20 Sep 2023 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695221033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e7ISnof8CX/FfcYGpifrhlGlhpyX8hQnhgl+VqBLEeg=;
 b=PJrNRZ21XXQCEAgJP9XN1/2IUZA4a/nd5KDElDZCuanUbPV2GPNUWHGZJUlxkVtR+8RtiE
 6Q51dxqRX17ZcjgEGLEGO7Xpr76xw8q7e70KB1AwIhkuR417kXhf966hctfDqmo9FJ3RMm
 pzr3OqmlPZhwNDPNPgVUwG2SDsDLN+4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-3tMeZgF0PsGH_JUwObIpiw-1; Wed, 20 Sep 2023 10:43:50 -0400
X-MC-Unique: 3tMeZgF0PsGH_JUwObIpiw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9ae418df26dso89502366b.3
 for <nouveau@lists.freedesktop.org>; Wed, 20 Sep 2023 07:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695221029; x=1695825829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e7ISnof8CX/FfcYGpifrhlGlhpyX8hQnhgl+VqBLEeg=;
 b=mIaoFdLXSJp3Qkh4DX7/vpWWBAaaNBLg0FxcC7gfhPdll0zYuFeZhoG40ZSz/u/c+z
 2zu6fzK0YG3qUfpnOA1z8x1HOcgNTa8oXoILq8G8UncvlzbE2P4in6CduAtUsbbKZku+
 PTbZXLcmtrRC5OIRS8JIYtNJ6qetL5i+8zW8F0vtmQhc1ET97Ii8yspDSypAIJVLlhik
 QmcAbXDK4W3Ma0PhUFsFSq4bdMBBUdmEdVedtUvqhv1s0lj1whMtAMZFM3L3RJkjJEb9
 RheN3X8UKEb2dCC5z++G+VjmKEoYTX8BMIs1LyApP/wq6Qo2E6Z+mYculshTw7EDjdo5
 9LXA==
X-Gm-Message-State: AOJu0YyF3OznYGVfwkbKWUNflN1OXo3gKyfr8TwyjwdBZOItJLWfLeRQ
 Uyku4Bmsa+cYZjg/oH/QnhP9Jr1j+ekS3PC5Vm3y6x6/VsHbyCk9Jla9sBEQU5yo5DdzvJIaJPt
 lohuJMWI30uo+UvzXKBzc0W6JOA==
X-Received: by 2002:a17:906:3098:b0:9aa:23c9:aa52 with SMTP id
 24-20020a170906309800b009aa23c9aa52mr2526316ejv.20.1695221029288; 
 Wed, 20 Sep 2023 07:43:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi8DifgwJBpyuwjYui0T/46qhPXxJizkNbjvUY9cG/IGS2/pBMoeEhNOGLTzQIKq97RA5gjA==
X-Received: by 2002:a17:906:3098:b0:9aa:23c9:aa52 with SMTP id
 24-20020a170906309800b009aa23c9aa52mr2526295ejv.20.1695221028945; 
 Wed, 20 Sep 2023 07:43:48 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a1709067c4900b0099c53c4407dsm9437889ejp.78.2023.09.20.07.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 07:43:48 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Date: Wed, 20 Sep 2023 16:42:33 +0200
Message-ID: <20230920144343.64830-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-misc-next v4 0/8] [RFC] DRM GPUVA Manager
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

Danilo Krummrich (8):
  drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm
  drm/gpuvm: allow building as module
  drm/nouveau: uvmm: rename 'umgr' to 'base'
  drm/gpuvm: add common dma-resv per struct drm_gpuvm
  drm/gpuvm: add an abstraction for a VM / BO combination
  drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
  drm/gpuvm: generalize dma_resv/extobj handling and GEM validation
  drm/nouveau: GPUVM dma-resv/extobj handling, GEM validation

 drivers/gpu/drm/Kconfig                   |    7 +
 drivers/gpu/drm/Makefile                  |    2 +-
 drivers/gpu/drm/drm_debugfs.c             |   16 +-
 drivers/gpu/drm/drm_gpuva_mgr.c           | 1725 --------------
 drivers/gpu/drm/drm_gpuvm.c               | 2600 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/Kconfig           |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c      |    4 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c |    2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c    |   52 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h    |    4 -
 drivers/gpu/drm/nouveau/nouveau_gem.c     |    5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h   |    4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c    |  207 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.h    |    8 +-
 include/drm/drm_debugfs.h                 |    6 +-
 include/drm/drm_gem.h                     |   32 +-
 include/drm/drm_gpuva_mgr.h               |  706 ------
 include/drm/drm_gpuvm.h                   | 1142 +++++++++
 18 files changed, 3934 insertions(+), 2589 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 drivers/gpu/drm/drm_gpuvm.c
 delete mode 100644 include/drm/drm_gpuva_mgr.h
 create mode 100644 include/drm/drm_gpuvm.h


base-commit: 1c7a387ffef894b1ab3942f0482dac7a6e0a909c
-- 
2.41.0

