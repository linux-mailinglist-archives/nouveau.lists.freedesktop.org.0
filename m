Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD6A17C15
	for <lists+nouveau@lfdr.de>; Tue, 21 Jan 2025 11:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C67110E554;
	Tue, 21 Jan 2025 10:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="enF4YWVG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D595310E165
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jan 2025 10:44:39 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e5447fae695so9131596276.2
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jan 2025 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737456279; x=1738061079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fM4RiAz8x0xBzhbf4AlSqIUYbrQ3SaJ7YEvWtIB73WA=;
 b=enF4YWVGtyD/lErCLhJEuj4Wrmc26M4NYMvGsRLmY7S5INLBbUgdNl8H69q5QFuNi9
 rrF2f34B/V4co7llkZKN05raYohWijWuaMgDPKPqcboD8CHw+bIkh64mEbiwE9wvDknL
 83fSC60Ro2D2aBASREeV4A19hwXvNlFKEOu9TKdx+iQf+Z3yNhTg8Gh9xkP7ystXq0U/
 Lu3Y5cpfJIu4oDZZqrdAV8p2Hc7P1RQcSRQIRwLlG1AqBQ09ICSUdGuVbFenZ+rKfyid
 HG7yaGSoh4iNZzSQIvJkIS9cC+P/5STzDblUZY5vOTi1rkHrYkSxAVjnKFQERfcKJJ9w
 BvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737456279; x=1738061079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fM4RiAz8x0xBzhbf4AlSqIUYbrQ3SaJ7YEvWtIB73WA=;
 b=BhE8MbQRuS8g6Pa6HpSXP9Ai/4xzundEafqeWSQtvuXZyJrqg1XnewSlRMP2AVJHZJ
 d9n3EWh2kLrKj/yDDkfK0xJTXNSSaxU0q91NOVpgr0CEyLR6l9C/8vCs+6/2ACDuL+FE
 AQy473abrNfEWqG4Mj/Lb4K/2Svbjrt1uXPi8rHfZRi6EGDEgkPMiS4tRJ2/Xkg0rZBX
 5QlQ3SfQ9131v/Gy64TZTr1wJpGguIG+GstFZBHMDqy1gJfuCx4o8j9vS0xAFt+1fs4c
 U9XGa5CCJfQ36UvDHHfzPbLiKr2FrXMFX7hAbuqctrcACGyBaeUeGYQOlPL/G9INKgpF
 bpMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/PAJTIvPjavkOgB6JC1yJ0SrzqskDOmNWFfojA/eB2F6S+FS4zdl22bdrl2N7u0YRGtvjH8E+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiwArIEscVNCq92wzEAJnu7nTM4UYv4fVBT1CMDjGVB8fcynQM
 fJpk3OW888LiGsgE/8SorABaTScbTFed44GWWc/qDcmp02PV3w5Lbe3HfAJMzwEQ/vYA/ozNI/y
 NuRSxfMD5QXB3r8My2G/wjPf2CE5EObp9LOtTEA==
X-Gm-Gg: ASbGncu8BgqiHn8SjjJZDJfLXGdUSatNiaATkwRzqMpoQonBdqi7zFM/VGquUGSWmez
 iifT+hqwaLrmE49JlKNrWnyR92RXiwUsHep2ih4ULLPK2TFZGP0nGUd7w59qAXbqVpQ==
X-Google-Smtp-Source: AGHT+IHO0V0jurSGd/L1Ymx0QNx/m/A6wTdCul+m+iz6FYx+lOCJoAuF4E4jOdjfH48/SXNUBM+6kJMlTjWcDWiw9yM=
X-Received: by 2002:a05:690c:3701:b0:6f6:d4bf:d01a with SMTP id
 00721157ae682-6f6eb940fb8mr129606697b3.34.1737456278815; Tue, 21 Jan 2025
 02:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
 <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
In-Reply-To: <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jan 2025 12:44:27 +0200
X-Gm-Features: AbW1kvabZ-in97OiEwfu0vjcyzelZUBMNUaWG-jd-XhigpbETlYrZDr4y_chW2I
Message-ID: <CAA8EJpos0HQpr9P4XRkto0Jy+Anf1xEH2xhEU8wtCyUQd+XwMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 21 Jan 2025 at 11:13, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Dmitry,
>
> On Tue, Jan 7, 2025 at 12:31=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> > > While working on the generic mode_valid() implementation for the HDMI
> > > Connector framework I noticed that unlike other DRM objects
> > > drm_connector accepts non-const pointer to struct drm_display_mode,
> > > while obviously mode_valid() isn't expected to modify the argument.
> > >
> > > Mass-change the DRM framework code to pass const argument to that
> > > callback.
> > >
> > > [...]
> >
> > Applied to drm-misc-next, thanks!
> >
> > [1/5] drm/encoder_slave: make mode_valid accept const struct drm_displa=
y_mode
> >       commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
> > [2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
> >       commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
> > [3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode=
_idx()
> >       commit: 5f011b442006ccb29044263df10843de80fc0b14
> > [4/5] drm/connector: make mode_valid_ctx take a const struct drm_displa=
y_mode
> >       commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
> > [5/5] drm/connector: make mode_valid take a const struct drm_display_mo=
de
> >       commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a
>
> I cannot find these in drm-misc or drm-next, but they are in drm-tip?

These are in drm-misc/drm-misc-next, the commit IDs are a part of the
Git history.

> The last one due to commit 2bdc721917cf141f ("Merge remote-tracking
> branch 'drm-misc/drm-misc-next' into drm-tip").
>
> What am I missing?
> Thanks!

It might be some kind of misinteraction between drm-misc-next vs
drm-misc-next-fixes vs merge window. Let me recheck dim rebuild-tip.

>
> P.S. Sima: noticed while resolving a merge conflict using drm-tip. Thx!


--=20
With best wishes
Dmitry
