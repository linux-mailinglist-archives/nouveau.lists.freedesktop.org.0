Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3D46F6B61
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8237310E3F7;
	Thu,  4 May 2023 12:31:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D3910E1B3;
 Tue, 17 Jan 2023 16:39:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65B22B8166E;
 Tue, 17 Jan 2023 16:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D5FC433D2;
 Tue, 17 Jan 2023 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673973552;
 bh=ySEJMU3KFh+SZ1kFanOfIpyzm2CVjH6uK0xDkFyQROU=;
 h=From:To:Cc:Subject:Date:From;
 b=eW7zq9g1aG1mp/LEKIMRBrKcu7V83Wp32f8TQWHkG7X1GY8T/FqSazEJLctqAuZN2
 7BqfQEtSyZhKlXvqJDAyvO8qeHGoS8/sbDOoEQJWRe4WhtinlYRUC+FTkBkNfUVFnX
 pMnMkh/cwVDHf2o2hJikIYAflfIeZfxuYlYPEwEDV6/jUlWFMV2gyE7f+HJspVLx72
 /kU/EMUzt51+eW92mKUCN5mMRcDyCgpbAUBHHl3213CZhlIwGupRg0jCXZUWIuUur/
 uA75N4S6APQJjsSCptU54CwkzuPmFgcmr6IRt7+9MTOv7C2h7T17ot3l4fVf/hX6k7
 VSISGdV7hoSCg==
From: Arnd Bergmann <arnd@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 17 Jan 2023 17:39:00 +0100
Message-Id: <20230117163907.1081223-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:34 +0000
Subject: [Nouveau] [PATCH] nouveau: fix nv50_wndw_new_() prototype
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
Cc: Dave Airlie <airlied@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc-13 complains about a mismatched function declaration:

drivers/gpu/drm/nouveau/dispnv50/wndw.c:696:1: error: conflicting types for 'nv50_wndw_new_' due to enum/integer mismatch; have 'int(const struct nv50_wndw_func *, struct drm_device *, enum drm_plane_type,  const char *, int,  const u32 *, u32,  enum nv50_disp_interlock_type,  u32,  struct nv50_wndw **)' {aka 'int(const struct nv50_wndw_func *, struct drm_device *, enum drm_plane_type,  const char *, int,  const unsigned int *, unsigned int,  enum nv50_disp_interlock_type,  unsigned int,  struct nv50_wndw **)'} [-Werror=enum-int-mismatch]
  696 | nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
      | ^~~~~~~~~~~~~~
In file included from drivers/gpu/drm/nouveau/dispnv50/wndw.c:22:
drivers/gpu/drm/nouveau/dispnv50/wndw.h:36:5: note: previous declaration of 'nv50_wndw_new_' with type 'int(const struct nv50_wndw_func *, struct drm_device *, enum drm_plane_type,  const char *, int,  const u32 *, enum nv50_disp_interlock_type,  u32,  u32,  struct nv50_wndw **)' {aka 'int(const struct nv50_wndw_func *, struct drm_device *, enum drm_plane_type,  const char *, int,  const unsigned int *, enum nv50_disp_interlock_type,  unsigned int,  unsigned int,  struct nv50_wndw **)'}
   36 | int nv50_wndw_new_(const struct nv50_wndw_func *, struct drm_device *,
      |     ^~~~~~~~~~~~~~

All the callers are ok, just the header file mixes up the order of
the arguments.

Fixes: 53e0a3e70de6 ("drm/nouveau/kms/nv50-: simplify tracking of channel interlocks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 591c852f326b..76a6ae5d5652 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -35,8 +35,9 @@ struct nv50_wndw {
 
 int nv50_wndw_new_(const struct nv50_wndw_func *, struct drm_device *,
 		   enum drm_plane_type, const char *name, int index,
-		   const u32 *format, enum nv50_disp_interlock_type,
-		   u32 interlock_data, u32 heads, struct nv50_wndw **);
+		   const u32 *format, u32 heads,
+		   enum nv50_disp_interlock_type, u32 interlock_data,
+		   struct nv50_wndw **);
 void nv50_wndw_flush_set(struct nv50_wndw *, u32 *interlock,
 			 struct nv50_wndw_atom *);
 void nv50_wndw_flush_clr(struct nv50_wndw *, u32 *interlock, bool flush,
-- 
2.39.0

