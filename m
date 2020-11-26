Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECEE2C4F13
	for <lists+nouveau@lfdr.de>; Thu, 26 Nov 2020 08:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFBE6E59B;
	Thu, 26 Nov 2020 07:05:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAB66E59B
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 07:05:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so1069146wmd.4
 for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2020 23:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ssUyDjxHgveCYHcSneSBCki2wyrxz+WJuAVHLW5ABU=;
 b=FxTEFUH67gsaxH703aaVavAsuhSKkvo8z/ec60AFRrzZRT9zOEETlanfV195SXR3cj
 SZRG+b59KIaQEGtefAFg4LVxVF5BIo2WhHa6aEn059GLC7SGtw2mHbdD5xY0zwHmhgE7
 yDjD017lZTgkTZPQ3gcUXxnLcvF9Kh0BRGf5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=+ssUyDjxHgveCYHcSneSBCki2wyrxz+WJuAVHLW5ABU=;
 b=JfPcJ923Cl0/EslZANpXrnYxtbTXfFowsgCbJ79yGdez1ar0+X7+YfyBbOgc7i9TrA
 Ud5R6KERZqI0by7DXHeSbPMlY92XmbMn8sex2ZGpHk05gWq56Lg00gNaV5e2JrAT9y6m
 ZwnTJr2JIWYCS3AoZptEX4J2S+YMH2O80jeT1GeXi4H8/PH0A/690ey3A0yyW1IpgzXe
 Q9I34DHjppc9hz9pQCpRkUNPh0gf0XjzDzx1TSZkH8Gv9cz1Q0lTJ/OTwOEs1Y7RSq5Z
 jjY0LL6bn2ebrMC2Vw0g6KYjiw77fJdNW8V5F2DTErYq30O2mr446zgYsUiklmmkgIYT
 asgg==
X-Gm-Message-State: AOAM530RYZ7Eh4A0johXiSkVtXQf5aTSEvrqMEnbXbug3VOjnhCRQYlk
 f63b0xcN3H/SjW5pN6Hd0X7v0w==
X-Google-Smtp-Source: ABdhPJzpkoO8QKPC6d3ZxgXrjJu4huFOtj4AiQ2JvXSolZ5ScNLTxBfP1RuqNtD6THSN9IgvknpK1g==
X-Received: by 2002:a05:600c:2601:: with SMTP id
 h1mr1626720wma.35.1606374312862; 
 Wed, 25 Nov 2020 23:05:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m3sm7310982wrv.6.2020.11.25.23.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 23:05:12 -0800 (PST)
Date: Thu, 26 Nov 2020 08:05:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Matti Hamalainen <ccr@tnsp.org>
Message-ID: <20201126070510.GA401619@phenom.ffwll.local>
Mail-Followup-To: Matti Hamalainen <ccr@tnsp.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20201120152338.1203257-1-ccr@tnsp.org>
 <CAKMK7uGDY+aLP-yYwyW5t-usUK3XM-oU9ZLHm1_jU0BTjJUN+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGDY+aLP-yYwyW5t-usUK3XM-oU9ZLHm1_jU0BTjJUN+g@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix relocations applying logic
 and a double-free
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
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 10:51:25AM +0100, Daniel Vetter wrote:
> On Fri, Nov 20, 2020 at 4:23 PM Matti Hamalainen <ccr@tnsp.org> wrote:
> >
> > Commit 03e0d26fcf79 ("drm/nouveau: slowpath for pushbuf ioctl") included
> > a logic-bug which results in the relocations not actually getting
> > applied at all as the call to nouveau_gem_pushbuf_reloc_apply() is
> > never reached. This causes a regression with graphical corruption,
> > triggered when relocations need to be done (for example after a
> > suspend/resume cycle.)
> >
> > Fix by setting *apply_relocs value only if there were more than 0
> > relocations.
> >
> > Additionally, the never reached code had a leftover u_free() call,
> > which, after fixing the logic, now got called and resulted in a
> > double-free. Fix by removing one u_free(), moving the other
> > and adding check for errors.
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: nouveau@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Matti Hamalainen <ccr@tnsp.org>
> > Fixes: 03e0d26fcf79 ("drm/nouveau: slowpath for pushbuf ioctl")
> > Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/11
> 
> Link: is for the mailing list submission of the patch itself (to link
> the git log to the mailing list discussions), this should be
> References: or similar. Aside from this:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Ben, I'm assuming you'll push this through your tree.

Ok Dave asked me to just push it into drm-misc-fixes.

Thanks for your patch!
-Daniel

> -Daniel
> 
> 
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_gem.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > index 549bc67feabb..c2051380d18c 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -558,8 +558,10 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
> >                         NV_PRINTK(err, cli, "validating bo list\n");
> >                 validate_fini(op, chan, NULL, NULL);
> >                 return ret;
> > +       } else if (ret > 0) {
> > +               *apply_relocs = true;
> >         }
> > -       *apply_relocs = ret;
> > +
> >         return 0;
> >  }
> >
> > @@ -662,7 +664,6 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
> >                 nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
> >         }
> >
> > -       u_free(reloc);
> >         return ret;
> >  }
> >
> > @@ -872,9 +873,10 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
> >                                 break;
> >                         }
> >                 }
> > -               u_free(reloc);
> >         }
> >  out_prevalid:
> > +       if (!IS_ERR(reloc))
> > +               u_free(reloc);
> >         u_free(bo);
> >         u_free(push);
> >
> >
> > base-commit: 3494d58865ad4a47611dbb427b214cc5227fa5eb
> > --
> > 2.29.2
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
