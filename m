Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD58207074
	for <lists+nouveau@lfdr.de>; Wed, 24 Jun 2020 11:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC916EAC0;
	Wed, 24 Jun 2020 09:53:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F356EAC0
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jun 2020 09:53:36 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id w6so1822728ejq.6
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jun 2020 02:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QSQCh3HE24N9RvzQyHV7808rdGVyY0Pj4nDg3e+Qg3g=;
 b=fEDZRxZprCHmbJVCqIgps+JcKh07mQNuczw3WeyKKoVjAaGWRR3qVh8Dhx++bAJvg/
 YJeQIG8+l1wNsNTVe3F5iIVsTh9LWN7vFUxJxR7Z/Tym0UKMlpxjQKMmKR6wPFf7KIuS
 KECJ1xDsrAXokdGsiRbKsIisGuS/n+BkAl9MSv3H+uXt+flued/+H+dkkB0r0a9y8TUQ
 l6YiPH5FVDKOTQuE3tljkOmMGwnb3cr5m52hrMkW0xX7PfbIjE7iRHta3vUJrXr+DClL
 1ymkrSfJfDZ4M7+qB2HAU498GtzpTnvQ+w7hs8ft8DHTdJon1nJxBb9DWTY8gL0lUuAz
 riIg==
X-Gm-Message-State: AOAM530M3XLxcyp3yw2bYuFLGtTMss7070XXvoXauZ8zDE9x46HA3trz
 WhhIZllR+E6Q+MAqBWQ1nbhpLfEvPAQfLagRYXBh6g==
X-Google-Smtp-Source: ABdhPJwkLNsaJPXmaK50CtKRIDJSMlVvXAKNkfDbRxUJTgyeK62cMc+ojnpcl95B0kigYjeip4q+izvr/ygSysoHLks=
X-Received: by 2002:a17:907:11c2:: with SMTP id
 va2mr24686834ejb.98.1592992415168; 
 Wed, 24 Jun 2020 02:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7wUswEqHJmmLx+bD4qeLnOEWdhxAK2mt-OXL37-e9NKCuBmQ@mail.gmail.com>
 <CAKb7UvhzgbjGjKzCETzLGJFR_H4+CUak88ZuNKK=dKqMoker4g@mail.gmail.com>
In-Reply-To: <CAKb7UvhzgbjGjKzCETzLGJFR_H4+CUak88ZuNKK=dKqMoker4g@mail.gmail.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Wed, 24 Jun 2020 11:53:24 +0200
Message-ID: <CA+7wUsxhEz_xdVo2S33Ozf-wQ7Z5PDLk6sq0kbaJC0Oy-K-XJA@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] Remove debug info from nouveau driver
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

Much better now. thanks !

On Tue, Jun 23, 2020 at 5:11 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> You probably have drm.debug set to something.
>
> On Tue, Jun 23, 2020 at 4:42 AM Mathieu Malaterre <malat@debian.org> wrote:
> >
> > Hi there,
> >
> > I am gettings tons of messages in dmesg output such as:
> >
> > [...]
> > [ 2419.238990] [drm:drm_mode_addfb2 [drm]] [FB:65]
> > [ 2419.243388] 00a0 2 base507c_ntfy_set
> > [ 2419.243391] 00000060
> > [ 2419.243391] f0000000
> > [ 2419.243393] 0084 1 base827c_image_set
> > [ 2419.243394] 00000010
> > [ 2419.243395] 00c0 1 base827c_image_set
> > [ 2419.243395] fb00007a
> > [ 2419.243396] 0110 2 base827c_image_set
> > [ 2419.243397] 00000000
> > [ 2419.243398] 00000000
> > [ 2419.243399] 0800 5 base827c_image_set
> > [ 2419.243399] 0007ce00
> > [ 2419.243400] 00000000
> > [ 2419.243400] 04380780
> > [ 2419.243401] 00007804
> > [ 2419.243402] 0000cf00
> > [ 2419.243408] 0080 1 base507c_update
> > [ 2419.243409] 00000000
> > [...]
> >
> > Does anyone know how to remove those extra debug info from nouveau driver ?
> >
> > For reference:
> >
> > # cat /sys/module/nouveau/parameters/debug
> > (null)
> >
> > Thanks much
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
