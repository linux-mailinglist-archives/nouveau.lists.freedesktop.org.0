Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF31CB1852
	for <lists+nouveau@lfdr.de>; Wed, 10 Dec 2025 01:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D3E10E646;
	Wed, 10 Dec 2025 00:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dMUSespG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A660E10E5D1
 for <nouveau@lists.freedesktop.org>; Wed, 10 Dec 2025 00:40:40 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4ee1fca7a16so52158751cf.3
 for <nouveau@lists.freedesktop.org>; Tue, 09 Dec 2025 16:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765327239; x=1765932039; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6wymOcLk7grT72mfA5h3N8IHYwLlfL5lz9NpBSo3BMM=;
 b=dMUSespG2rDCVyWgDgLAu+6EmOxtz4eFQKDuhiVzGI6/QtoObh6TMjykZ0jatAoA4V
 qP0CoS3GC/7pgX3w68eufT0aoDdkeQWwHLyZBAPetrXg4+eI11KwWENAt2Ibup58jm5o
 aUVvpkW56ED/uqCdrQHMScbS/57ZDoNnbJlV1HkY1uNevMOOUBC4wKSYG2qblixlfkBU
 c12g5NW4Kx+bcVcjrnyUBGZ13ngaDRnksOLGVdYYNPkeTV+PizmdFR1G8rkYhBi0O9I4
 5e2LXmUiVHnj0/d+u+j7nloSUUSoCPr71lEIQ8q5YZ0zA+BDtyXxjHTNVFzDaLG1BnIZ
 ovTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765327239; x=1765932039;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wymOcLk7grT72mfA5h3N8IHYwLlfL5lz9NpBSo3BMM=;
 b=E90XLx30Xt6ruukj2T5J00zL5LB5IZN7rKTS6AjFpk8eV6lU+ReW+oiFs4rNpyPCqq
 CT+r0iimm4SuQcJR1fxE5VgW3hBe9XTMYP91PtNjgamjPLjR0jCaFUaI6BrWkH91dkc1
 GcqZzczauMhpWBeIsDlAhpoJmAujRKQ/QdcRIwOh//e+fUmfj4258BJtDyHTEf44WmNR
 I+eAW5JOXfW/eMLgdAbDFYRMcq5RZurPbM4+wFw+nul687gy2SuVW0lvhCA86qPF60El
 2/y7SgooX/wLMXcb5G1YCnMox+xSXY79uGT/jmDELPd6+xwDj4a5MkD3zQD9URtGgHU2
 PU1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFd8mih5uhyXu9xT7/Zm8292yPPvqOP4CwAGIiB72NUbFo7f0sd5q2mGn31bBwJHcUYbcUhSJ4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkis1TZB/hR5oPOi39W8uncOMu+u7XK+mWLeYuNXnr1MKWaoPj
 OjKFtDhCqBlQrV358pwF6hZyc1r9Svp+uFrNODZ6kKTy1cu1WTAyGf89NIc7iNB4SB69qxyiCV+
 mFckxPpJUQIbRWmegjJewz1/H1pzST6I=
X-Gm-Gg: ASbGnctjwrUg+P7o9yaY4fzlktqFb3yEmcoAf++xdeMnbRlRGcKq/oiNu9lzTGS80v+
 l+gNsK5qHCq7JpQplEPChjSvFP8Morftiyt29kYGpblLhASxcyOrL2NaMJzKBvDCEDNsFDoADqu
 sqeJcKjvKMFdNg4pWc1cX3UMebaBPb3ZqDaXRFypRDh6ZhiEjXtWQBF8sW0hQ9cPP+siaH1c2VY
 pqPAQcBCNSwuaJtf4XURXAXuc0UuZ/m1JUEk+26SwJ7bnceHX9L7r4qHrm4T0y0wLrHEICk2w==
X-Google-Smtp-Source: AGHT+IF/YC0wH4HTdXv6pBm0higZhgIr6sri+RQProT90pYcXmiv4UEnt1bnDECpeUGNAkSQJpp1ZNSu2G91t4JCDtM=
X-Received: by 2002:a05:622a:4814:b0:4ed:e0c1:44d5 with SMTP id
 d75a77b69052e-4f1b1a071ccmr9294931cf.19.1765327239484; Tue, 09 Dec 2025
 16:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20251205213156.2847867-1-lyude@redhat.com>
In-Reply-To: <20251205213156.2847867-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 10 Dec 2025 10:40:28 +1000
X-Gm-Features: AQt7F2olu1ewz5U3w0AuR9qHG-FpMcQsFdcic-uQjr_AUIrpcOyV2fiEy8XZ48c
Message-ID: <CAPM=9txpeYNrGEd=KbHe0mLbrG+vucwdQYRMfmcXcXwWoeCkWA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/dispnv50: Don't call
 drm_atomic_get_crtc_state() in prepare_fb
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 James Jones <jajones@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 6 Dec 2025 at 07:32, Lyude Paul <lyude@redhat.com> wrote:
>
> Since we recently started warning about uses of this function after the
> atomic check phase completes, we've started getting warnings about this in
> nouveau. It appears a misplaced drm_atomic_get_crtc_state() call has been
> hiding in our .prepare_fb callback for a while.
>
> So, fix this by adding a new nv50_head_atom_get_new() function and use that
> in our .prepare_fb callback instead.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> Fixes: 1590700d94ac ("drm/nouveau/kms/nv50-: split each resource type into their own source files")
> Cc: <stable@vger.kernel.org> # v4.18+
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/atom.h | 13 +++++++++++++
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c |  2 +-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> index 93f8f4f645784..85b7cf70d13c4 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> @@ -152,8 +152,21 @@ static inline struct nv50_head_atom *
>  nv50_head_atom_get(struct drm_atomic_state *state, struct drm_crtc *crtc)
>  {
>         struct drm_crtc_state *statec = drm_atomic_get_crtc_state(state, crtc);
> +
>         if (IS_ERR(statec))
>                 return (void *)statec;
> +
> +       return nv50_head_atom(statec);
> +}
> +
> +static inline struct nv50_head_atom *
> +nv50_head_atom_get_new(struct drm_atomic_state *state, struct drm_crtc *crtc)
> +{
> +       struct drm_crtc_state *statec = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +       if (IS_ERR(statec))
> +               return (void*)statec;
> +

So I was at kernel summit and someone was talking about AI review
prompts so I threw this patch at it, and it we shouldn't use IS_ERR
here, and I think it is correct.

get_new_crtc_state only returns NULL not an error.

Dave.
