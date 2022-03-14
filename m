Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2697D4D8EF8
	for <lists+nouveau@lfdr.de>; Mon, 14 Mar 2022 22:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BDB10E116;
	Mon, 14 Mar 2022 21:43:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3907B10E116
 for <nouveau@lists.freedesktop.org>; Mon, 14 Mar 2022 21:43:10 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id b14so12052428ilf.6
 for <nouveau@lists.freedesktop.org>; Mon, 14 Mar 2022 14:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TGfgOe8NJToJBFMsYOSdYdWZmOw6Xuid7xEpuSd0o/0=;
 b=e5CY0LfNgAFQjtvMKrlLilcfsciWCEvVWre/0EF6z5HfmA1rM8q3XoWuGJWS45FxnF
 JGKDPNv8ni+UHnBPd+jPSuBuuhCt5uZYfji3lU1SvPPwjttivnpOhLTPGBACtIzhSfbf
 eI6lU3+mwP7P43+XL7ap7jCQeFGdMV0eNcwMDIxtbB4x8UKGECAhvMvpIu2s2jlSaT1M
 NYeH5rYPCfu61OXVkdAdQW5IWYFR04r64GkN3iw6+hZdBxj/6wn/8viR7kAvEEDkse9b
 +bsbyNolRQNt/s1rOCR/HmugJHT7l5W/UP1LNoIpdnMtMBgHwBF/bMO5/kdLWE8FdzsP
 8yzA==
X-Gm-Message-State: AOAM531eNtjBCP3CBPJsCyPLougbCXCHfBIrwf3zOyMQQb8q1PrnoJYR
 pkQURILnedbj5T2vLXcg8zE7bro4HrBQAX1tAwWyihAZ
X-Google-Smtp-Source: ABdhPJxGFglrJUhZUy/mZiWZQ+ZGEv6k5tzQvJ/3baboOcM9R1QHaJInZwBzWw7CvfgIi46vo6F+Z7huY3GSTvXUwXA=
X-Received: by 2002:a92:1902:0:b0:2c7:94cb:14b6 with SMTP id
 2-20020a921902000000b002c794cb14b6mr8398540ilz.70.1647294189351; Mon, 14 Mar
 2022 14:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtcoLYpx0Dnr8VbtBV74aiwGm1UkCHqJOZAxGb9-tG7o6=gjA@mail.gmail.com>
 <CAKb7UvihMs9b_mjsSoGrZRM0qLUYwGQdfnznqNKPhSF6TUpyEg@mail.gmail.com>
 <CAJtcoLZgBYuFbAqUz5KUHeZYGLTr_489MTuc7eCWTd+WP7bBtA@mail.gmail.com>
In-Reply-To: <CAJtcoLZgBYuFbAqUz5KUHeZYGLTr_489MTuc7eCWTd+WP7bBtA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 14 Mar 2022 17:42:58 -0400
Message-ID: <CAKb7Uvgv9Y8NKbgiq0zPRrf-ROT-z-BQO4Xj9d04a5wTAoqVaQ@mail.gmail.com>
To: Martin Knoblauch <knobi@knobisoft.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Nvidia GK106GLM (Quadro K2100M) with Nouveau
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 5:30 PM Martin Knoblauch <knobi@knobisoft.de> wrote:
>
> On Mon, Mar 14, 2022 at 7:45 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > Hi Martin,
> >
> > Depends what your expectations are. Nouveau is missing a number of
> > features of the blob, the most important of which is probably
> > stability. Whether you run into instability or not depends a lot on
> > the software that you use, so you'll just have to find out for
> > yourself if it works well for you or not. Personally, I have
> > multi-month uptimes with it. But others struggle to stay up for an
> > hour.
> >
> > With GK106, you should have manual reclocking, which should enable you
> > to achieve ~50-80% of blob performance, if that's a concern for you.
> > You won't get Vulkan nor H.264 hardware encoding.
> >
> > Cheers,
> >
> >   -ilia
> >
> Hi Ilia,
>
>  most of my expectations would be met, if I were able to get a decent
> resolution from the GK106. As it is the card is not recognized, and it
> falls back to VESA with 1280x1024 which is pathetic. I have not much
> need or expectation on speed.

That's not normal. Please post logs. Perhaps you have nouveau
blacklisted or something like that? Nouveau should definitely
recognize your card.

  -ilia
