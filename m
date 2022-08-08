Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E357F58CF74
	for <lists+nouveau@lfdr.de>; Mon,  8 Aug 2022 22:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285A811B283;
	Mon,  8 Aug 2022 20:58:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from gregdf.com (gregdf.com [152.228.171.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C233411B1D7
 for <nouveau@lists.freedesktop.org>; Mon,  8 Aug 2022 20:58:12 +0000 (UTC)
Received: by gregdf.com (Postfix, from userid 1000)
 id 8C1DC7DE6C6; Mon,  8 Aug 2022 22:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gregdf.com; s=mail;
 t=1659992277; bh=1bCluPfieUWR62aFW9+HiYHfaLVI1ToZ1MwhWWY/azY=;
 h=Subject:From:To:Date;
 b=pgJc/BhFDSXGati1tONbIrRal4JeyHW39GtGfSDy5DTqvZ7qiAWqRbICydbB0P3+b
 5veowuZ/JYHP3xmnXhRC3Vq8O88bOFlBOk8hc17Ijxvw8shHfqQyXewk6vh7DrdW9U
 UnUZWNptvn/63RL9aZ8KmMTiiJUTDkFOp7MvThh0=
From: Greg Depoire--Ferrer <greg@gregdf.com>
To: nouveau@lists.freedesktop.org
Message-Id: <20220808205757.8C1DC7DE6C6@gregdf.com>
Date: Mon,  8 Aug 2022 22:57:30 +0200 (CEST)
Subject: [Nouveau] Busy poll during commit
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

Hi,

Moving the cursor in circles on Linux 5.18 with a GTX 1070 mobile and a 120 Hz
display uses ~30% CPU.

Using perf shows most of the instructions are spent polling in
base507c_ntfy_wait_begun in drivers/gpu/drm/nouveau/dispnv50/base507c.c:

int
base507c_ntfy_wait_begun(struct nouveau_bo *bo, u32 offset,
			 struct nvif_device *device)
{
	s64 time = nvif_msec(device, 2000ULL,
		if (NVBO_TD32(bo, offset, NV_DISP_BASE_NOTIFIER_1, _0, STATUS, ==, BEGUN))
			break;
		usleep_range(1, 2);
	);
	return time < 0 ? time : 0;
}

That function is called from drivers/gpu/drm/nouveau/dispnv50/wndw.c:

int
nv50_wndw_wait_armed(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
{
	struct nv50_disp *disp = nv50_disp(wndw->plane.dev);
	if (asyw->set.ntfy) {
		return wndw->func->ntfy_wait_begun(disp->sync,
						   asyw->ntfy.offset,
						   wndw->wndw.base.device);
	}
	return 0;
}

Which in turn is called from nv50_disp_atomic_commit_tail in
drivers/gpu/drm/nouveau/dispnv50/disp.c:

	/* Wait for HW to signal completion. */
	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
		struct nv50_wndw_atom *asyw = nv50_wndw_atom(new_plane_state);
		struct nv50_wndw *wndw = nv50_wndw(plane);
		int ret = nv50_wndw_wait_armed(wndw, asyw);
		if (ret)
			NV_ERROR(drm, "%s: timeout\n", plane->name);
	}

I haven't found many resources on how commits work. Could busy polling be
replaced by something else?

Additional information that might be helpful: with printks I found that
nv50_head_vblank_handler in drivers/gpu/drm/nouveau/dispnv50/head.c is always
called right before base507c_ntfy_wait_begun finished.

So for instance this patch drops the CPU usage by making sure that
base507c_ntfy_wait_begun does not even enter the loop using
drm_atomic_helper_wait_for_vblanks to wait for the vblank.

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 5863a689818c..f535ded86b2f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2186,6 +2186,8 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
	if (atom->lock_core)
		mutex_unlock(&disp->mutex);

+	drm_atomic_helper_wait_for_vblanks(dev, state);
+
	/* Wait for HW to signal completion. */
	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
		struct nv50_wndw_atom *asyw = nv50_wndw_atom(new_plane_state);

Regards,
Greg
