Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197844D8BE8
	for <lists+nouveau@lfdr.de>; Mon, 14 Mar 2022 19:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C65310E1AD;
	Mon, 14 Mar 2022 18:45:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C3C10E1AD
 for <nouveau@lists.freedesktop.org>; Mon, 14 Mar 2022 18:45:24 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id j29so11677347ila.4
 for <nouveau@lists.freedesktop.org>; Mon, 14 Mar 2022 11:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PHndU7ItMkBwGuG68Tjv+G0f4M1j00vTUBHplGBaB58=;
 b=l+MP6EF8Yj7lwhx9hR6LbQlnJQTbAFFHYEZicLOyLCdcXrh/KyAjAvkwDIcXkDTGwQ
 u3MmcVbXwPpcNeAJngDqABtUZhXRENCyjLhDCYGbPlxk0pnefvVoNwjuTw6l3emlcUGy
 iP62fGAI7DltUaGUeJe69wibkAXysyJC61Mnrtdya13K07pr4Mx8xEyDNZCA4Nru8jwv
 nDTypDdB0z8Ioa5LvBr2IgjAEkIZsU3w8wbAlZcqTe72oTM5k/YFdHRYkDIveHilMMXU
 NLA5s2g0Y203rN3V7xEezWWIO82sseiONGH0oDzvNsKQiAy99pEuoh03x+xbC9NeDUW0
 pqNw==
X-Gm-Message-State: AOAM531SUy8afrL362hS/tS7cuRnwu3RUjpbJ8KVqbpqWvz25FT7BY6m
 ayvqaGg6/jXTY3HtZ+/ca3sQZmMqzr/BR7cY/k9QGo+l
X-Google-Smtp-Source: ABdhPJxK0kbJRdV6qR57LHby0kK8tvEiFibox3JOfvRzXDPMQtwIrCfEm6b5NPowO6witylzdpwJX6tusRvkpFqHIh0=
X-Received: by 2002:a05:6e02:1c86:b0:2c1:a67f:3d37 with SMTP id
 w6-20020a056e021c8600b002c1a67f3d37mr20160645ill.298.1647283523882; Mon, 14
 Mar 2022 11:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtcoLYpx0Dnr8VbtBV74aiwGm1UkCHqJOZAxGb9-tG7o6=gjA@mail.gmail.com>
In-Reply-To: <CAJtcoLYpx0Dnr8VbtBV74aiwGm1UkCHqJOZAxGb9-tG7o6=gjA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 14 Mar 2022 14:45:12 -0400
Message-ID: <CAKb7UvihMs9b_mjsSoGrZRM0qLUYwGQdfnznqNKPhSF6TUpyEg@mail.gmail.com>
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

Hi Martin,

Depends what your expectations are. Nouveau is missing a number of
features of the blob, the most important of which is probably
stability. Whether you run into instability or not depends a lot on
the software that you use, so you'll just have to find out for
yourself if it works well for you or not. Personally, I have
multi-month uptimes with it. But others struggle to stay up for an
hour.

With GK106, you should have manual reclocking, which should enable you
to achieve ~50-80% of blob performance, if that's a concern for you.
You won't get Vulkan nor H.264 hardware encoding.

Cheers,

  -ilia

On Mon, Mar 14, 2022 at 11:55 AM Martin Knoblauch <knobi@knobisoft.de> wrote:
>
> Hi,
>
>  for years I have been running my DELL M4800 Laptop under Linux with the proprietary drivers from NV. Finally I am kind of sick of recompiling those drivers every time I upgrade the Kernel.
>
> So, my question is: is there any chance to operate a GK106GLM using nouveau.ko?
>
> Sorry if this has been asked before.
>
> Cheers
> Martin
> --
> ------------------------------------------------------
> Martin Knoblauch
> email: k n o b i AT knobisoft DOT de
> www: http://www.knobisoft.de
