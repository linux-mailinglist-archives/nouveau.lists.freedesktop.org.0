Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2904421165
	for <lists+nouveau@lfdr.de>; Mon,  4 Oct 2021 16:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E30E6E1B8;
	Mon,  4 Oct 2021 14:31:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1676E1B8
 for <nouveau@lists.freedesktop.org>; Mon,  4 Oct 2021 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633357910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khVDKyCgJwbfVnRRJFQB+Qcg3RCv+I5JMkL9oO0gvj8=;
 b=BkWBwqQ1zSNmOkXx+ulD/vlbOxRx2Shh38MtwGq2Nzg2gMT0HjdflHmrqIrooiPcvNVaun
 vVjTKkP2rny5w8bcko4VKqmYUlUuLL2EEGH/lvCyK2rI/KyBV6tBc8gXyX89Eh6M0TYC07
 QL/uv9D24y0uaLGAa/o/ZKnOELaM//0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-ZCNvEEISNd2RmTkAGdfpxw-1; Mon, 04 Oct 2021 10:31:47 -0400
X-MC-Unique: ZCNvEEISNd2RmTkAGdfpxw-1
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adff5c2000000b00160b12639a5so547099wrp.3
 for <nouveau@lists.freedesktop.org>; Mon, 04 Oct 2021 07:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=khVDKyCgJwbfVnRRJFQB+Qcg3RCv+I5JMkL9oO0gvj8=;
 b=u4NPwkwt7hkzCH7MpY2m72ENwN6pbvscpjssio2dDnXQzaduXmdfQceMNKVqkp2DSn
 H0pVJUJLatjzGj8wlJzf5JnAy3/gHk3Gj+qt7VjJJroQf8fnCipcCmmFhOsjqz/e3VxP
 iP+9OfkvtUQc59pctDsKXl+aNNRnnVjAceFLlQg08ab1R8bDzSGver4w6qxv0PBwkIjD
 eIRd2AJzEwmjC6Iw+t6mWnrwq46qKh3nx9Ey3quiMk2U15bcI3nRpnWOW+pVG4m7xule
 HhIMK6NsDssJ5lO1Ra/X/TgMDgKcb4xKdcClXnuV3ll4ihoAjHXvMg/ZEogdpT0nz4Hf
 hOsQ==
X-Gm-Message-State: AOAM530JS9M7rrM/cTMxmRi44Vgi5aj02iTmns0CuLcDBmTF0jQpljRZ
 vNkWUK7XVyiSFFZeDGelFdo8vhofby5qF0IefKdinictAR9TjonRVkxvaxS8/pfvJ+Nn9mklAne
 D/QaH8SoaPKRMx4snhn0OooV8WAEAhsAWj6N0B80Yew==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr9400711wmh.74.1633357906047; 
 Mon, 04 Oct 2021 07:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2o7biOqQFnZdDZdHT8IshuUzM9Zacfh6XxLBcPnT9PCiwH7KSDmv2mgvvvBosC8RqWNMESlhUdQpMp8/KBgI=
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr9400687wmh.74.1633357905877; 
 Mon, 04 Oct 2021 07:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <CANj0vJkjpj_wQPVKo65ZKTgvTjXOfpC3hBdW60Z27c0mY8ejtA@mail.gmail.com>
In-Reply-To: <CANj0vJkjpj_wQPVKo65ZKTgvTjXOfpC3hBdW60Z27c0mY8ejtA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 4 Oct 2021 16:31:35 +0200
Message-ID: <CACO55tvnT4mT1cVyMTOig5M1kVj07i8ZH28EN11fYYuB+L+abg@mail.gmail.com>
To: Oswaldo Graterol <oswaldo.graterol@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, glenn.kennard@gmail.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] Nvidia GeForce 8200M - Image flicker
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

We actually fixed a few of those issues on those old GPUs. But I don't
think they are part of any mesa release yet:

https://gitlab.freedesktop.org/mesa/mesa/-/commit/1387d1d41103b3120d40f93f6=
6a7cfe00304bfd7

and we have a pending MR:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12154
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12241

Glenn, is there some update on those MRs? In case you are short on
time, maybe somebody else should take a look?

On Sat, Oct 2, 2021 at 4:24 AM Oswaldo Graterol
<oswaldo.graterol@gmail.com> wrote:
>
>
> Hi,
>
> I installed lubuntu 20.04 amd64 in my old laptop (Compaq CQ60-210 US), bu=
t the screen flicker when i open some program like firefox, i tried nvidia =
drivers to GeForce 8200M GPU, but no work to this hardware, i want to use n=
ouveau drivers but need to fix the flicker problems. Can you help me with t=
his?
>
> Thank you for any help you can provide.
>
> --
> Oswaldo Graterol

