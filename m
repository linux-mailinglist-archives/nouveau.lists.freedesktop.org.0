Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912C477F444
	for <lists+nouveau@lfdr.de>; Thu, 17 Aug 2023 12:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0310E432;
	Thu, 17 Aug 2023 10:25:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE78510E42E
 for <nouveau@lists.freedesktop.org>; Thu, 17 Aug 2023 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692267899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IRxWEvpry+CMCB1V4M7R9Ft7ALq/o4jMyxueGSdGQE=;
 b=KIH4PzMw33zvBgI3uF7YkDOj/R1xvs1kh++GHbBo4ACLUvCZrISrfO1DMAaXas1DE395qA
 kvETQ19fiQCxxk14FvbNdhKEeos5AQR/wgk6wuzdh7hMcKAC00u0Xk6iWet0vqFs+nx2Ey
 j8RIVx3t72OoNbPZNh9ORNe1LLEmtSY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-U7c79bfMP7WAz1Bi3uS44A-1; Thu, 17 Aug 2023 06:24:58 -0400
X-MC-Unique: U7c79bfMP7WAz1Bi3uS44A-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b9b7375e49so17543901fa.1
 for <nouveau@lists.freedesktop.org>; Thu, 17 Aug 2023 03:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692267897; x=1692872697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1IRxWEvpry+CMCB1V4M7R9Ft7ALq/o4jMyxueGSdGQE=;
 b=E7iX0iniGugwU2RVbONJd/rLylnK39TVVT9wM6SY/KixAf3JbubUl3bD2g3F7GeBLo
 5dStp/58o6VLXSB/tncTkZcNuMrL3891D5hto8km8xBGjI1YS4S4TP758pNvywU0GtxL
 ST6qKPOz5YgK7RRFCLTYgixmCxrB/L8H3ptWdPNsF8hKJmomqWWnO3vqv5hWmQ1X3Zvi
 PXMum3Q2GHQa8iZmnVG4Kw5mrtpedFa+LXhiQzBdMrOB6lo6SN4vmd6oavsLoxVmcVCy
 fNFfRc0gpQeyVfQneBkLRxdpWi6RbiU75UjHJiuUuIFdrreAFJGUFzZjy3cKaiPjPPyH
 C5Rw==
X-Gm-Message-State: AOJu0YzdOTrDKGtcAsLgD0yamuqNBTweOPsiAOXFjIw211HjqiX5haEL
 yRHmLGuu3aQs5q1zUN44eAWgkXBrII5mzEKFM6cAA2xOG6UQY9vK/W+pUkNd5NZVuJrqGjZu0O/
 q8mBYLkRuAxYpj0Vg+SO8Ha38gVUChIe/GE5NsqEQAQ==
X-Received: by 2002:a2e:511a:0:b0:2b9:7034:9bbe with SMTP id
 f26-20020a2e511a000000b002b970349bbemr2980383ljb.4.1692267896885; 
 Thu, 17 Aug 2023 03:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBgIDULJ6Inl1Pke61/jYkvIRMPsZ4hSRwZSoxXgucJresEcAyxdEKMlWsoFg6hvKo7nHipu3sd9ZNJWFoGNg=
X-Received: by 2002:a2e:511a:0:b0:2b9:7034:9bbe with SMTP id
 f26-20020a2e511a000000b002b970349bbemr2980368ljb.4.1692267896541; Thu, 17 Aug
 2023 03:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
 <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
 <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
 <20230817081032.GAZN3V+NQ1blzQC2sU@fat_crate.local>
 <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
 <CACO55tuWTYngfw+MZnan+U4eYyE+SvOWgxzffaCMNGQgriq3ig@mail.gmail.com>
 <20230817101129.GCZN3yUTWHkt22Jgec@fat_crate.local>
In-Reply-To: <20230817101129.GCZN3yUTWHkt22Jgec@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Aug 2023 12:24:45 +0200
Message-ID: <CACO55tt9ZLKjaTyARXQ4VePgd41nYCQBn+wAGGDJRw1QV3hPBQ@mail.gmail.com>
To: Borislav Petkov <bp@alien8.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: fix use-after-free in error
 handling of nouveau_connector_create
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
Cc: Takashi Iwai <tiwai@suse.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 12:11=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Thu, Aug 17, 2023 at 12:00:47PM +0200, Karol Herbst wrote:
> > btw, what would help is to know where `nvkm_uconn_uevent` actually
> > fails, or rather, are you running into this "/* TODO: support DP IRQ
> > on ANX9805 and remove this hack. */" condition?
>
> Send me a diff, I'll run it here and catch output over serial.
>

simply throw a

printk(KERN_WARNING "nvkm_uconn_uevent %u\n", outp->info.location);

inside drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c:104 after that
mentioned comment.

> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

