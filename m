Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F824422C1
	for <lists+nouveau@lfdr.de>; Mon,  1 Nov 2021 22:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498786E0C2;
	Mon,  1 Nov 2021 21:37:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5266E0C2
 for <nouveau@lists.freedesktop.org>; Mon,  1 Nov 2021 21:37:07 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id h7so69466083ede.8
 for <nouveau@lists.freedesktop.org>; Mon, 01 Nov 2021 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=ZRqiZB/DebAWu1rfZlwd/0Dbi0hJ/rFw5uBEBWvJEWo=;
 b=UYWBoGSOfP7xDTSUSUylYpjWv0Fx11PZPu/ICF4aFwK55YAshl3cavtot00fmYpKTG
 S9S7QgeQlEmsGOJDFCqD/cJDFgqEHoD2k/HQd6vVx/GfyEFFAejCuvDlFT2aCt6u5zf7
 7PR5zsU/z1WJlfREQJq8p5/sxFfgkuF7UrCbSoL2l0gVUqAJKOjvXipNTTkYRRfhMxXC
 6LLGV5kBOmBOQe5hQBM90eKG15VLMoJgHzrfVZGLsu000R0sAJnftlfq1UN0n44pujI5
 cXPa8pe5YnYUOMINBMLB1BWarIz08n8FfxKfrEJXbkm3Tg2FcqUcJzi/3uuWTC75ZUyG
 o6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=ZRqiZB/DebAWu1rfZlwd/0Dbi0hJ/rFw5uBEBWvJEWo=;
 b=LZ+Krht54vKRDpIuheXdiF742dsI5qUYUroqUB0XHgwWQ+XTRt7+dXakbzGtL4Q2ab
 mQY5kmtogaQ48ejlwOpf1x1asedLoce8IJiIMtPS7AkuLfWo6aipZUDz9P0D23JFVx5i
 F/zsiK3cnQuLm12yqXtQ+NMKuBKe1psXgz1adpbuv5EqI06Bmw2tV/azPwuVzOdUgamN
 lB/Y30QfH9umZ/yQ4nZt//jd083tBEGXxBLWfh0ZDlmDLgyiUFIinnBtLf1mrqpCGFnB
 bpAQ8mNOIEuOju2tADv5oHpkci8xepat2m9G+upkTV9/KcqbNXRng/3YY7pm5S/damTX
 66TA==
X-Gm-Message-State: AOAM533ekwMb2drgJchpKetmo1fiK5Q+ajiK+GUTCbEO1Y7M8gQfoGXu
 o8Ok2RrlASJ2U45vGfHbXdt9xTUcx6MtRKF++CXYkwvj
X-Google-Smtp-Source: ABdhPJyqYfgtd6RJs1qZlb9aOqa8EHj3x2ZuOyBvxHM6e2L/NBJYp7a4ojGNXP2yu2Pi6AEeLiJIq9rD+YCzJ1vNFys=
X-Received: by 2002:a17:907:c15:: with SMTP id
 ga21mr7384079ejc.349.1635802625468; 
 Mon, 01 Nov 2021 14:37:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:4c95:0:0:0:0 with HTTP; Mon, 1 Nov 2021 14:37:04
 -0700 (PDT)
In-Reply-To: <CACO55tv3DfrYObTfP7OqzOH6mESXx_KD5HRDtDaikUr0gH3hGg@mail.gmail.com>
References: <CAD8U+g_=X07mpM4_EJ_vteqTNdYqH+Ev7ihgea25qJW-3FZ_uw@mail.gmail.com>
 <CACO55tuZwYJKKBfHd5cgEv3_ry+B5fMO=4KCUGhvwyX8=Kq_hQ@mail.gmail.com>
 <CACO55tv3DfrYObTfP7OqzOH6mESXx_KD5HRDtDaikUr0gH3hGg@mail.gmail.com>
From: riveravaldez <riveravaldezmail@gmail.com>
Date: Mon, 1 Nov 2021 18:37:04 -0300
Message-ID: <CAD8U+g8n8DDEKxGg0mNjGwsZ8+0PFyM6PSzzD7ThKvqNowciQw@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000069edc105cfc0fa7c"
Subject: Re: [Nouveau] Various kernel error messages on updated Arch box
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

--00000000000069edc105cfc0fa7c
Content-Type: text/plain; charset="UTF-8"

On Monday, November 1, 2021, Karol Herbst <kherbst@redhat.com> wrote:
> Actually.. seems like somebody already filed a bug like this:
> https://gitlab.freedesktop.org/drm/nouveau/-/issues/91

Should I add my dmesg there?

> Seems to be more widespread so I will check out if I hit this as well.

Great. Thanks a lot again. Let me know if I can help.

--00000000000069edc105cfc0fa7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Monday, November 1, 2021, Karol Herbst &lt;<a href=3D"mailto:kherbst@red=
hat.com">kherbst@redhat.com</a>&gt; wrote:<br>&gt; Actually.. seems like so=
mebody already filed a bug like this:<br>&gt; <a href=3D"https://gitlab.fre=
edesktop.org/drm/nouveau/-/issues/91">https://gitlab.freedesktop.org/drm/no=
uveau/-/issues/91</a><br><br>Should I add my dmesg there?<br><br>&gt; Seems=
 to be more widespread so I will check out if I hit this as well.<br><br>Gr=
eat. Thanks a lot again. Let me know if I can help.

--00000000000069edc105cfc0fa7c--
