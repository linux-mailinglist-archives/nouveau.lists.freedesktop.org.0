Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 423D527D4D6
	for <lists+nouveau@lfdr.de>; Tue, 29 Sep 2020 19:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27A289C0A;
	Tue, 29 Sep 2020 17:48:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFF689C0A
 for <nouveau@lists.freedesktop.org>; Tue, 29 Sep 2020 17:48:16 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601401695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLjQ0rN6KmnUItq2ER6jfhjpvWS6hMbKwqFF/tMKmWg=;
 b=aK6qOtB6fa/EXiWAC9OE0Xrm7SJlCBknb/u3eXDMoJmDrCVSY17pI8ktqdVVbnJUHeOtg/
 qCKEN8BFTisy7hLduInS5RDSFcJas5G+7WI4cNNb0hrP7JK7TDUN36OeIKXIH/3TJmUPfu
 ES1xCIFgVqBpqq5jgDA0IvmMhfl0rjs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-PSCGXRQKPJSe1zr_DLHkgA-1; Tue, 29 Sep 2020 13:48:13 -0400
X-MC-Unique: PSCGXRQKPJSe1zr_DLHkgA-1
Received: by mail-qv1-f71.google.com with SMTP id h9so3006313qvr.3
 for <nouveau@lists.freedesktop.org>; Tue, 29 Sep 2020 10:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=SLjQ0rN6KmnUItq2ER6jfhjpvWS6hMbKwqFF/tMKmWg=;
 b=r9Hfu9AlH77ODdd7h7e3+hP2T+fBSg/rwWGtoy1huztbMa6Ko4f2gKNkvoRM8yTMEh
 irI/HFxxjLzrbzCSlTVEmYa9/+t4y6nKe2Orw4BR7FcSm1rbafluhus77pPbIuJz2hsm
 slZ4Zsbrnk7qeRqMneDy+Bnm6qn7xQ6XmHjK1rm4UZGGioGZIXyg6004H40dR+OkU4+n
 vW0hEHeyANoQ7QW7KloOi9uGV6RBZ7BBN2lBXpaZ1Ua+ml26ZKDrAz3avQcDV7etfCkG
 jrFFuiBErS3nT6dd2fJFUoJY0I1ORT72O30E1GlKZfWtAk2Hsdcx+wFuS9hPyADtGPIr
 wR7w==
X-Gm-Message-State: AOAM530ww3a6eVNvHLQbf2QXvesz5N1rvr/4QrCqlgh9u9V7G8SnK6g1
 LIZjAc5zm45xDkxHr+sKNIwskY7NbP8lgouU+oEG85i0bfpknnBN0AY5u14qw6mVEHifU2GlqN2
 PMKfqLZokVuXjA3Kqt28XHZlSRg==
X-Received: by 2002:ac8:1b57:: with SMTP id p23mr4500322qtk.180.1601401692778; 
 Tue, 29 Sep 2020 10:48:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDi8khABJj1dSyzdi5wQpCFlW4vQgrea5dK3AQJJbNFGbQvR4aQUB8Yf1ylyDkNIfBiCARFA==
X-Received: by 2002:ac8:1b57:: with SMTP id p23mr4500303qtk.180.1601401692444; 
 Tue, 29 Sep 2020 10:48:12 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id e58sm487995qtc.92.2020.09.29.10.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 10:48:11 -0700 (PDT)
Message-ID: <123dc7e767889fe0f58734cb8b56630c5c0b3aba.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 29 Sep 2020 13:48:10 -0400
In-Reply-To: <CAKb7UvgL_rV73BqvVoZsagy+_+cnBios1pKazq064D51NdAuqw@mail.gmail.com>
References: <20200922210510.156220-1-lyude@redhat.com>
 <CAKb7UvhAb0wFd9Qi1FGJ=TAYZJ9DYXL6XXMfnG49xEO=a9TuYg@mail.gmail.com>
 <7b10668ee337e531b14705ebecb1f6c1004728d6.camel@redhat.com>
 <CAKb7Uvj++15aEXiLGgSZb37wwzDSRCetVT+trP6JNwhk8n-whA@mail.gmail.com>
 <8bd8ee03f88e7e674e0ea8c6d63d783777cfe414.camel@redhat.com>
 <CAKb7UvgL_rV73BqvVoZsagy+_+cnBios1pKazq064D51NdAuqw@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: Fix clock checking
 algorithm in nv50_dp_mode_valid()
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 2020-09-25 at 19:53 -0400, Ilia Mirkin wrote:
> On Fri, Sep 25, 2020 at 6:08 PM Lyude Paul <lyude@redhat.com> wrote:
> > On Tue, 2020-09-22 at 17:22 -0400, Ilia Mirkin wrote:
> > > On Tue, Sep 22, 2020 at 5:14 PM Lyude Paul <lyude@redhat.com> wrote:
> > > > On Tue, 2020-09-22 at 17:10 -0400, Ilia Mirkin wrote:
> > > > > Can we use 6bpc on arbitrary DP monitors, or is there a capability
> > > > > for
> > > > > it? Maybe only use 6bpc if display_info.bpc == 6 and otherwise use
> > > > > 8?
> > > > 
> > > > I don't think that display_info.bpc actually implies a minimum bpc,
> > > > only a
> > > > maximum bpc iirc (Ville would know the answer to this one). The other
> > > > thing
> > > > to
> > > > note here is that we want to assume the lowest possible bpc here since
> > > > we're
> > > > only concerned if the mode passed to ->mode_valid can be set under
> > > > -any-
> > > > conditions (including those that require lowering the bpc beyond it's
> > > > maximum
> > > > value), so we definitely do want to always use 6bpc here even once we
> > > > get
> > > > support for optimizing the bpc based on the available display
> > > > bandwidth.
> > > 
> > > Yeah, display_info is the max bpc. But would an average monitor
> > > support 6bpc? And if it does, does the current link training code even
> > > try that when display_info.bpc != 6?
> > 
> > So I did confirm that 6bpc support is mandatory for DP, so yes-6 bpc will
> > always
> > work.
> > 
> > But also, your second comment doesn't really apply here. So: to be clear,
> > we're
> > not really concerned here about whether nouveau will actually use 6bpc or
> > not.
> > In truth I'm not actually sure either if we have any code that uses 6bpc
> > (iirc
> > we don't), since we don't current optimize bpc. I think it's very possible
> > for
> > us to use 6bpc for eDP displays if I recall though, but I'm not sure on
> > that.
> > 
> > But that's also not the point of this code. ->mode_valid() is only used in
> > two
> > situations in DRM modesetting: when probing connector modes, and when
> > checking
> > if a mode is valid or not during the atomic check for atomic modesetting.
> > Its
> > purpose is only to reject display modes that are physically impossible to
> > set in
> > hardware due to static hardware constraints. Put another way, we only
> > check the
> > given mode against constraints which will always remain constant
> > regardless of
> > the rest of the display state. An example of a static constraint would be
> > the
> > max pixel clock supported by the hardware, since on sensible hardware this
> > never
> > changes. A dynamic constraint would be something like how much bandwidth
> > is
> > currently unused on an MST topology, since that value is entirely
> > dependent on
> > the rest of the display state.
> > 
> > So - with that said, bpc is technically a dynamic constraint because while
> > a
> > sink and source both likely have their own bpc limits, any bpc which is
> > equal or
> > below that limit can be used depending on what the driver decides - which
> > will
> > be based on the max_bpc property, and additionally for MST displays it
> > will also
> > depend on the available bandwidth on the topology. The only non-dynamic
> > thing
> > about bpc is that at a minimum, it will be 6 - so any mode that doesn't
> > fit on
> > the link with a bpc of 6 is guaranteed to be a mode that we'll never be
> > able to
> > set and therefore want to prune.
> > 
> > So, even if we're not using 6 in the majority of situations, I'm fairly
> > confident it's the right value here. It's also what i915 does as well (and
> > they
> > previously had to fix a bug that was the result of assuming a minimum of
> > 8bpc
> > instead of 6).
> 
> Here's the situation I'm trying to avoid:
> 
> 1. Mode is considered "OK" from a bandwidth perspective @6bpc
> 2. Modesetting logic never tries 6bpc and the modeset fails
> 
> As long as the two bits of logic agree on what is settable, I'm happy.

I gotcha-I guess I was just confused because this is already possible with the
current code we have (and it was also possible before we started adding these
checks into ->mode_valid, which is why I need to get to the max_bpc
thing soon). I guess I'll just use the connector's reported bpc for now until
we add support for that
> 
> Cheers,
> 
>   -ilia
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
