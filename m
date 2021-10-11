Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F413B428BC1
	for <lists+nouveau@lfdr.de>; Mon, 11 Oct 2021 13:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81246E47A;
	Mon, 11 Oct 2021 11:05:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422FB6E47A
 for <nouveau@lists.freedesktop.org>; Mon, 11 Oct 2021 11:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633950335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qqwarFeT31WucRL0zO1fL8nWRb97yKjsbZwzOxQYcE0=;
 b=WHgtu7s9twMr+vvtN2DV/0PvnQm9RnPQqT+OYRKYXuLl4SkmBcoCQY4t88Y7JiaRZrHXEx
 GgfkrxHjww2VBadENqKwH4Jjs7AfOmSFAm1ojyuAVn/lh3Rmcj/WubTdmHCqaEq//JqOeO
 Jm/gIwUqRCEwjVyjPOXD9uOHbE0VvYw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-2rAEW2BXNu2fL6BYEvd1AQ-1; Mon, 11 Oct 2021 07:05:34 -0400
X-MC-Unique: 2rAEW2BXNu2fL6BYEvd1AQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so12982756wrc.21
 for <nouveau@lists.freedesktop.org>; Mon, 11 Oct 2021 04:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqwarFeT31WucRL0zO1fL8nWRb97yKjsbZwzOxQYcE0=;
 b=EYtqb8nVEa+yOc8g05a7na47Z8vE7OLUdepZO//VBTE48YZu2toMWfS4785unvfPNa
 YnzrtoOsVU/CVFIenKYz33gDvZTEda1JEBswWIM01+f3mLc74Uc385NOko4RBFCiX4Ax
 xdbM7e/3s8TLbYPaqjMjJRH/2rWvjslHEVEgxpoCH1OwCYtyzk36/UhHui9+M+8RAoct
 RPxwZqAOyIfvqt1tgDR+I7hcpBS4n71gP4Cv9Ybsc5ttR0HU2LL1+acQUxGIWD4H0kGo
 iVbR0cdGYG0roGWTau4pC1h3J0Zz5w/o8/Dh45flvhi/yglhJMkDzsjWv3bx/7q1FVX5
 y6pQ==
X-Gm-Message-State: AOAM5305Mg0E1hTJ1exQQvdi8/bUVBow6+vzEqpPXDRJpe7+BJDK3KOz
 nRBz8I36iHOmWo9aDU9epGOrFFXxm1aPkyOB5afSfUbIkZqMyPVPCq+mxAlxJsfZIGYQEWf9nFB
 zGkS/3Kj7blwD2cg7goJ08Gx5zetTPQs0QhWgW0mwhA==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr1062883wrx.142.1633950332637; 
 Mon, 11 Oct 2021 04:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymCu73G3BRVLMl9xIjMR0joyr0NS2Ue72qfyWiUehpYMDt1yD/CSX8Bop+8rXWnzKIdbYUvwRga/7vANKIHH8=
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr1062853wrx.142.1633950332452; 
 Mon, 11 Oct 2021 04:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
 <b4da382b17a77b66e45fd374c9d806dac6054e3a.camel@redhat.com>
 <YRoN0vWFN6Lw22ej@eldamar.lan>
 <418fdcbcf554d34cc6423a88974f916b64b3664c.camel@redhat.com>
 <YWPiU+9G0AKglHmi@eldamar.lan>
In-Reply-To: <YWPiU+9G0AKglHmi@eldamar.lan>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 11 Oct 2021 13:05:21 +0200
Message-ID: <CACO55tvokQBKz1ZyhK_2hN=V7rgV3n_L=PYNh8RLA+y8n93qRQ@mail.gmail.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Lyude Paul <lyude@redhat.com>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH v2 0/3] drm/nouveau: fix a use-after-free in
 postclose()
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

I am currently checking the ML for such old patches, just have to make
sure it's actually fine and not breaking stuff as well.

But I think we will pull this in soonish, I just also work on
improving our CI stuff at the same time by trying out some things.

On Mon, Oct 11, 2021 at 9:06 AM Salvatore Bonaccorso <carnil@debian.org> wrote:
>
> Hi Ben,
>
> On Tue, Aug 17, 2021 at 04:32:31PM -0400, Lyude Paul wrote:
> > It may have been, we're in the process of trying to change around how we
> > currently accept nouveau patches to stop this from happening in the future.
> >
> > Ben, whenever you get a moment can you take a look at this?
> >
> > On Mon, 2021-08-16 at 09:03 +0200, Salvatore Bonaccorso wrote:
> > > Hi,
> > >
> > > On Fri, Mar 26, 2021 at 06:00:51PM -0400, Lyude Paul wrote:
> > > > This patch series is:
> > > >
> > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > >
> > > > Btw - in the future if you need to send a respin of multiple patches, you
> > > > need
> > > > to send it as it's own separate series instead of replying to the previous
> > > > one
> > > > (one-off respins can just be posted as replies though), otherwise
> > > > patchwork
> > > > won't pick it up
> > >
> > > Did this patch series somehow fall through the cracks or got lost?
>
> Looking some older threads, noticed this one. Ben did you got a chance
> to look at it, or is it now irrelevant by other means?
>
> Regards,
> Salvatore
>

