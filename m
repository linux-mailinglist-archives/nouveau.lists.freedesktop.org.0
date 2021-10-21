Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340A43689C
	for <lists+nouveau@lfdr.de>; Thu, 21 Oct 2021 19:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511CF6ECE9;
	Thu, 21 Oct 2021 17:03:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E8A6ECDB
 for <nouveau@lists.freedesktop.org>; Thu, 21 Oct 2021 17:03:21 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so6151935pjq.0
 for <nouveau@lists.freedesktop.org>; Thu, 21 Oct 2021 10:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dTcg4nnP3Q8OPOldUBNlJ77tCd6O60oSXI5JUaJbrOw=;
 b=eW1MZxI1OmRUonS9v1rnZyRZSTC93O+t4454bYQxxN7sTvn0gzcyFi6nR0qXvK+4i4
 ZkvHDpSMKZdH0IBFm9GsdJJkj+iDsEKWm5Xf/0sD2bDbWvHj+sIVH7sSu7kpTC2CY72U
 acruMO4FPGAcQz5J7GuxKRVt/F5ICDOn9khtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dTcg4nnP3Q8OPOldUBNlJ77tCd6O60oSXI5JUaJbrOw=;
 b=3NwPwEiiQu1KmS5+d9VMFteYqZJzCCx7Pkp7tTjRsEE4wF5xOuhQe7cwU7kqBBD8zn
 ggACaaffpRDUYfqgbn8ROiK6XjsOE5aqmW1c8xMWN/WpPsuhOOyo8Hm6d91vLCS34p4G
 0hfK512zGfT9IOv2hP7cWzENRGwSRdSM4lO50tr54/FSHi7GSCWjxcfTuAsZZ8wMt5nO
 a0zOHWGTGSoclyk/cG+0S51MVksblec15dG/I13pKZNeDUDke7yX8VWcOVdzlnNeLL0s
 cKRhjDxqaithr7k9zpWxjfAoIMVrb0EmgdY6VDnekBmJi1StEx66iDxIDbDCvQFt41FO
 QNhQ==
X-Gm-Message-State: AOAM530MbYRTPR1PccE2/cd395msms/1qgAhzC2nyE4EKwGurXEzFRrK
 8+SPTNqg48awkGuYnc+MzHVX+5NsEm8=
X-Google-Smtp-Source: ABdhPJxZPJROdmRol0REI+7u9He1qjFMzOPLeVcePBcrcnWgEUcZVclthczh6pTD+jqh26sdf0mjdg==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
 oo15mr8220645pjb.87.1634835800642; 
 Thu, 21 Oct 2021 10:03:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id pc3sm6654862pjb.2.2021.10.21.10.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:03:20 -0700 (PDT)
Date: Thu, 21 Oct 2021 10:03:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org
Message-ID: <202110211002.CB975695@keescook>
References: <20210928222513.GA294575@embeddedor>
 <CACO55tsD98dNzw8fP=CiKLsdbnn2Vg78+wTRM90kutHtv1RZ5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACO55tsD98dNzw8fP=CiKLsdbnn2Vg78+wTRM90kutHtv1RZ5A@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH][next] nouveau/svm: Use kvcalloc() instead of
 kvzalloc()
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

On Wed, Sep 29, 2021 at 05:28:47AM +0200, Karol Herbst wrote:
> Lack of documentation inside Linux here is a bit annoying, but do I
> understand it correctly, that the main (and probably only) difference
> is that kvcalloc checks whether the multiplication overflows and
> returns NULL in this case?

That's correct. :)

> On Wed, Sep 29, 2021 at 12:21 AM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> >
> > Use 2-factor argument form kvcalloc() instead of kvzalloc().
> >
> > Link: https://github.com/KSPP/linux/issues/162
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

> > ---
> >  drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> > index b0c3422cb01f..1a896a24288a 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> > @@ -992,7 +992,7 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
> >         if (ret)
> >                 return ret;
> >
> > -       buffer->fault = kvzalloc(sizeof(*buffer->fault) * buffer->entries, GFP_KERNEL);
> > +       buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
> >         if (!buffer->fault)
> >                 return -ENOMEM;
> >
> > --
> > 2.27.0
> >
> 

-- 
Kees Cook
