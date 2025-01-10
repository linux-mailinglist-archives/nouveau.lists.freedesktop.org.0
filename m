Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C7A08996
	for <lists+nouveau@lfdr.de>; Fri, 10 Jan 2025 09:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E86E10EFFD;
	Fri, 10 Jan 2025 08:10:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C9310EFFD
 for <nouveau@lists.freedesktop.org>; Fri, 10 Jan 2025 08:10:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1tWA1z-0008Lc-0Q; Fri, 10 Jan 2025 09:06:11 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tWA1x-0007gT-21;
 Fri, 10 Jan 2025 09:06:09 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tWA1x-0001oH-1d;
 Fri, 10 Jan 2025 09:06:09 +0100
Message-ID: <abd8ec5ad105d61f2ff372f88d7376bdf245acef.camel@pengutronix.de>
Subject: Re: [PATCH v2 10/25] drm/imx/ipuv3: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Date: Fri, 10 Jan 2025 09:06:09 +0100
In-Reply-To: <20250109150310.219442-11-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-11-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: nouveau@lists.freedesktop.org
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

On Do, 2025-01-09 at 15:57 +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the framebuffer width to be a
> multiple of 8. The scanline pitch has be large enough to support
> this. Therefore compute the byte size of 8 pixels in the given color
> mode and align the pitch accordingly.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
