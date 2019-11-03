Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFF12B292
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8834489949;
	Fri, 27 Dec 2019 08:13:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462746E061;
 Sun,  3 Nov 2019 17:20:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f4so10501476lfk.7;
 Sun, 03 Nov 2019 09:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7/J3WmH+heGbGFy441q1wW8UBPaHKts1+/gJ9Oc9zwI=;
 b=emu7lu9ijDrRW/BWDaIamH9xSPbfBFUYLQDPtJjsozXGmHTnXsLjNpM7J37vyEazo7
 fluVfoDCa6w2Z3g/d//s3/IXKtCJ99ccsS5hMB6j0wglWSWvGAyt+897tpcJuZrRGimW
 abUDObykwGaLjNqwJttll6bVflBwzVCNU/rqv5JkdLvCk1tZETwTRcxyuhMtzrU7uJo1
 yod1axA8c7LwN/AWneM+QYMwUXTYBi8KpC559MuZMoXcpEubCpD6gOMNn/QOPx/lZzr6
 4W5T9FAtxPEpzCi64gINVww1PnOHY4wQzko4aLJhSp4IL6mA2/72eCkkgy1VSNyXaPFD
 ubow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7/J3WmH+heGbGFy441q1wW8UBPaHKts1+/gJ9Oc9zwI=;
 b=lTv1c6zaHT6wUl8R+6iAGhf91sjHsrsxdg+bwUWD5vafxBMdMXbsGNpElwR2rytibu
 I6yLGkJUQpQ/0e4gRGF4olUVlBjp6+c9FEEdoxSddHz3Ox7hcJR22mT3JqOjXQ3CoWHV
 SMwZK7jFb5Ls61h99iPO5Q812HllYSKTiNRMvuBoMJ2NRq9boHmaAgkA2H3wzyV3Tqcy
 0qnR6ZHXxMDixIShbFkmFTlwtzuO+JoifnyTm+ZEKk7CBrZB0xZaj7lUGiJbfRwgiLFp
 /LiBGPue3zUaA6I5K61UUcxVD0+cEjt9rXJcpDCWt1oGtPRB6a+jxEuSBo/ZyjvB2OpT
 cKEw==
X-Gm-Message-State: APjAAAUhcLF2PtrHbCu+L+3+boRRrn66m05xSvo86POguip2JJPhPry/
 EiZgQAG7sYWjwmrmvKLxXS5Tq4L/Pa5o64fRgZI=
X-Google-Smtp-Source: APXvYqyTOfX9lg31WTjo2Fa1qfsfmxdXDL/Y1XpeXC386prybErMv5mrJbiefJ32/2M79L0S9SQ0ycxt9V0ZqloB4VM=
X-Received: by 2002:a19:e018:: with SMTP id x24mr13626910lfg.191.1572801631502; 
 Sun, 03 Nov 2019 09:20:31 -0800 (PST)
MIME-Version: 1.0
References: <91aa24ed23e2b8c012ec43ef9eb5baed2532f96c.camel@redhat.com>
In-Reply-To: <91aa24ed23e2b8c012ec43ef9eb5baed2532f96c.camel@redhat.com>
From: Roman Gilg <subdiff@gmail.com>
Date: Sun, 3 Nov 2019 18:11:11 +0100
Message-ID: <CAJcyoyui_fUasU4dKNHY60DEMAUSPwHMO8smNdcSO9ftY2z2nQ@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:01 +0000
Subject: Re: [Nouveau] Individuals interested in VESA memberships?
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
Cc: xorg-devel <xorg-devel@lists.x.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 "members@x.org" <members@x.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 1, 2019 at 9:06 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Hi! Recently I've been working with the rest of the X.Org board to try to get
> X.org access to VESA memberships so that contributors that don't have an
> employer who is able/willing to join VESA can potentially get access to the
> various benefits of a VESA membership, such as access to DisplayPort
> specifications. Since I need to gather a list of interested X.org members, I'd
> like to know who all might be interested in a membership like this. There are
> no costs involved, as the VESA membership we're looking at in particular comes
> at no cost to us since we're a non-profit.
>
> The current plan is to extend VESA membership to X.Org members who
> specifically request it. If you think you'd be at all interested in this, or
> know any projects or contributors who would be, please feel free to respond to
> this message and let me know!

Hi Lyude,

I would be interested.

Thanks,
Roman

> --
> Cheers,
>         Lyude Paul
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
