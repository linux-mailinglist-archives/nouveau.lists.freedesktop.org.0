Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EC04BDAE5
	for <lists+nouveau@lfdr.de>; Mon, 21 Feb 2022 17:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5026110E746;
	Mon, 21 Feb 2022 16:42:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE4B10E750
 for <nouveau@lists.freedesktop.org>; Mon, 21 Feb 2022 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645461770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WN5pE4mPYjqAbDGa+uZP9tXI1ijs0aAGV+A9gWV3hXM=;
 b=h0FdNpPhY0F0bgMMh9uqVwRt7cBjDfjLAXoPwcTdQ4gt00dao7WqGHz6GHx5xunfUoIl9S
 3ohUOvOSzFTYfqFSWq58PJ7xbQL7zD/iixqHYATQMD6TsZpVnhmJf9espie9xDUYntr4E7
 pbyNTcvBP79e5X4c3fIEzy7FvxZ66wk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-_HgZVIsGMGmSajHm2TZmYg-1; Mon, 21 Feb 2022 11:42:48 -0500
X-MC-Unique: _HgZVIsGMGmSajHm2TZmYg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v17-20020adfc5d1000000b001e6405c2b56so7687940wrg.7
 for <nouveau@lists.freedesktop.org>; Mon, 21 Feb 2022 08:42:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WN5pE4mPYjqAbDGa+uZP9tXI1ijs0aAGV+A9gWV3hXM=;
 b=ySTEkshxtTQ9rpvygLn81+B+SDY0303mcVjbRQFKDTXmn+ur/Af+gLeiqLkuFBGHYZ
 94chNpIpajtcc4sTuYockCEued9r7pyCZE/KwOk5cB7Mr37uDwHTl1UbvzVLipC6+mjj
 oIJiWAZS5xoNy2IPGT2ntvOIO5F5Vpe12JoZuShFuzzS8wf9ROwfALVsK9lo+NoeQEs2
 dEwgok3NsDrsntEv/KnEfhegwnt0TKTxCWIE+ICbbWyKUuInnEDlfeppl01L7m6G6iX+
 emLpzI0dmD4lgjjm63TZoXB0xkAsNaZtWDtTa0kX0/RXlQPox3P/4xKIggeZilQHP1Dr
 Y5oA==
X-Gm-Message-State: AOAM531BnYdcCBefAsaiFvkCkWBjItr9AGy3HQnRH+u6K/RPE/8OOwUH
 cYofwcBRWqJJ559uLaP3Qz1P/cWAM9dK/8GfJmS0r3z6gl6If8G47NmFiCewQAAFqEsOF7h/rdT
 DwFUpIIIrSmwCjHbGKZ00EY1ebWtpQYUqhYenrqdUYg==
X-Received: by 2002:a5d:53c4:0:b0:1e6:5b69:a25a with SMTP id
 a4-20020a5d53c4000000b001e65b69a25amr16500851wrw.341.1645461767603; 
 Mon, 21 Feb 2022 08:42:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBxuHa25XMuCyoTGfqLp5J08XAoasVbZ6wpJ/0QNFDz1nFAgQsu9IYWsOLBOiUu4LmeYHQdQIvRt5jz6tJVfg=
X-Received: by 2002:a5d:53c4:0:b0:1e6:5b69:a25a with SMTP id
 a4-20020a5d53c4000000b001e65b69a25amr16500836wrw.341.1645461767427; Mon, 21
 Feb 2022 08:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-14-maxime@cerno.tech>
In-Reply-To: <20220221095918.18763-14-maxime@cerno.tech>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 21 Feb 2022 17:42:36 +0100
Message-ID: <CACO55tt8eTkEZp_DSFQ3Lt3+WBX1g3iwrB6-eTT=91bAk1NPEw@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH v2 13/22] drm/nouveau/kms: Remove redundant
 zpos initialisation
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 11:00 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The nouveau KMS driver will call drm_plane_create_zpos_property() with
> an init value depending on the plane purpose.
>
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in nv50_wndw_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
>
> Cc: nouveau@lists.freedesktop.org
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 133c8736426a..0c1a2ea0ed04 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -635,8 +635,6 @@ nv50_wndw_reset(struct drm_plane *plane)
>                 plane->funcs->atomic_destroy_state(plane, plane->state);
>
>         __drm_atomic_helper_plane_reset(plane, &asyw->state);
> -       plane->state->zpos = nv50_wndw_zpos_default(plane);
> -       plane->state->normalized_zpos = nv50_wndw_zpos_default(plane);

so reading the surrounding code a little it feels like those
assignments actually do something. If my understanding is correct
plane->state points to &asyw->state, but asyw was just kzalloced in
this function. __drm_atomic_helper_plane_reset doesn't set the zpos or
normalized_zpos fields as long as zpos_property is 0, so those fields
won't be set with that change anymore.

I just don't know if it's fine like that or if this function should
set zpos_property instead or something. Anyway, the commit description
makes it sound like that an unneeded assignment would be removed here,
which doesn't seem to be the case. But I don't really know much about
all the drm API interactions, so it might just be fine, mostly asking
to get a better idea on how all those pieces fit together.

>  }
>
>  static void



> --
> 2.35.1
>

