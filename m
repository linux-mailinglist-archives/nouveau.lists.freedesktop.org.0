Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05421C5AD7
	for <lists+nouveau@lfdr.de>; Tue,  5 May 2020 17:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503306E1B9;
	Tue,  5 May 2020 15:17:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC7D6E1B9
 for <nouveau@lists.freedesktop.org>; Tue,  5 May 2020 15:17:16 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id w68so582124vke.5
 for <nouveau@lists.freedesktop.org>; Tue, 05 May 2020 08:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hxu52BkDb+/vyYgzX8Xnpe07A8mUp+xjwtoY7VOBGMA=;
 b=WsfQxOD0BCuQ0hMAKMgt9dGyvSv5oVzyAUBhu18hp7KH7Fo0mGI9mXm0UTxfm9a+u2
 wRcO1ffxcFA3h6OrsdcT+bLgD6WcuTXBlvo9WfdsKbg3ZZpokL858DgIS1va//Narq9C
 GT6ZyZIhsWtjoa8qSGWCpv+KgGX91gp//QurciTlsbkLzehOUqNQ3UqQ5fXapjqivvJq
 CJ+j3b4FZNXpH0oeKB/flmg9PgSm93iZB12uY8o2vxWQ/8jI/tso7zFUW2DNUrKTvnJ/
 4gl7rka/44on3DflV8P6jH6eOuq3An3v5E7WsHg0y2+GhBqNcdKep5zF5HkoxXqIJJfe
 qPSw==
X-Gm-Message-State: AGi0Publc+Viek9GeM0dX8TFQ9Bnt9Abd1JbGZ5Q9pY+L7iBtru/g3VG
 T9XNwyQ5ICMBwnaPAvt0YHjjtW4gLQy49GCEBuCbJbsd
X-Google-Smtp-Source: APiQypJkBwQ00jQqmmvPA+zmcbMNRSuXKAbqOQ0NLj8Dt7E2uLRlF1UFNF1LLc4MC0ZcaWV6b/cfv0qhJyt9htTcGd4=
X-Received: by 2002:a1f:a844:: with SMTP id r65mr2935130vke.56.1588691835711; 
 Tue, 05 May 2020 08:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <46ba2ff8-c8cf-0f72-62d0-b17178b0f2ac@tripolho.com>
 <CAKb7UvguvnBnauKhcc4CPoZE=vRzj46JWKQDND=MBJZ89p13vg@mail.gmail.com>
 <a6346e40-a4ed-0d59-47c9-3afea2dd7274@tripolho.com>
In-Reply-To: <a6346e40-a4ed-0d59-47c9-3afea2dd7274@tripolho.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 5 May 2020 11:17:04 -0400
Message-ID: <CAKb7Uvjt77zM0ATjwCNcCAh46+kj8HkOAinuN8vdUACKcPPGjg@mail.gmail.com>
To: Alberto Sentieri <22t@tripolho.com>
Subject: Re: [Nouveau] problems with NVS310
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, May 5, 2020 at 11:02 AM Alberto Sentieri <22t@tripolho.com> wrote:
>
> I have two monitors connected to the PC. One is an AOC 23" (1920 x 1080)
> and the other is a BenQ 27" (2560 x 1440). Nothing special about them.
> BenQ has a display port and the AOC uses some sort of DVI adapter.

Do you know if the DVI adapter is active or passive? (If you include
the EDID, that should become apparent. It should be visible in "xrandr
--props")

>
> I have this event many times and I captured dmesg twice. At least at one
> time I captured dmesg my computer was under high load: it had about 15
> to 20 windows opened (spreadsheets, Thunderbird, Firefox, virtual
> machines under virtual box), there was a lot of disk activity and I was
> as trying to capture a screenshot from Firefox using the screenshot
> tool. I could not make everything fit into one screen, so I hit F11
> (while in Firefox), captured what I needed (now it fit), and when I
> pressed F11 again to make Firefox come back to a regular window, it
> locked: I could not move the mouse and caps lock led was frozen.

Hm, moving between full screen/not is at least a page-flip if wayland
is being used. I guess it's plausible.

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
