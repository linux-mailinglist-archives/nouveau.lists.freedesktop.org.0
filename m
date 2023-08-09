Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F315777674B
	for <lists+nouveau@lfdr.de>; Wed,  9 Aug 2023 20:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF7710E492;
	Wed,  9 Aug 2023 18:30:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F6B10E492
 for <nouveau@lists.freedesktop.org>; Wed,  9 Aug 2023 18:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691605828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mbjndyEV18fW8Q6aaYiEgoKrYM26FczR+bnw1W1kYtY=;
 b=fD/VvTsJmOivGjkjUN91U9TuLuX5YxAIsRzS05UAtNDpqkiXUXKQRkeNGq96bum5U/ykSb
 8iyshUqNSmQ4gI0pvLURljraf+1CaMCwrLvV7v2YZUw5pPYc5SqhMh2tC/kUsZYy+TQn7y
 fxUqh5uLgPDhSgRhel4Fk+RGpCCwAkc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-9owVPoupO4Sl6SecxcL_CQ-1; Wed, 09 Aug 2023 14:30:26 -0400
X-MC-Unique: 9owVPoupO4Sl6SecxcL_CQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso260361fa.0
 for <nouveau@lists.freedesktop.org>; Wed, 09 Aug 2023 11:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691605825; x=1692210625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mbjndyEV18fW8Q6aaYiEgoKrYM26FczR+bnw1W1kYtY=;
 b=YmLzb79mJQ4nWNiz12efcUE2vw0THUiRYj5aCNpvih5Nna9YU88T5/R704FcQVDPwj
 lmx/I9Y56CTWGRbMur5qGo7BrUmKiHSHz30bAIlJb1zqdeR0r0O0oU4VAKBZxy5MzKK1
 tnlXERYagCK5brAvSCn7/VRELpbnHti+VLDF6uzIG9mvf1VI33qCQ3uVjzQbkre8pXUs
 Ojy/1e8Nd2oNkCnZEc0LLl60YbsFeNH1bkGcaTY/gFy6J6VyfmvLazg2w+S4S9j6pPgS
 KKbn6no+TE9Y0VjGpx0KEuKOr7E9XW9cAyCZgC00u9hRpkn+keUCNlWi5HStwoh3Pjxp
 x8Yw==
X-Gm-Message-State: AOJu0Yxzdcqi1kAms3bfUOC9Ji4s0gNvIEJGazwjM/F5SxfyDbauwnoL
 VqpkPsv3kB4rqsmryYnqrMOJ7TqvCzIxxn0Uc+zZFufElpHUWHl7RW0zPvUJVqSpkPVX0KvneoK
 BnTV/M7KkIiXAkcDGWFFg8jTvQFUye2EhSkHNzfcwpg==
X-Received: by 2002:a2e:bc26:0:b0:2b9:6610:d7ca with SMTP id
 b38-20020a2ebc26000000b002b96610d7camr2960819ljf.5.1691605825386; 
 Wed, 09 Aug 2023 11:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyvglv3LGH/ukn+Eb+jsR7KbtrzIbPTNwruMlpHnbwXO1CT5AZMoySQQYEHX6dyFsxo+vCB9UAiYpnP5/b6aw=
X-Received: by 2002:a2e:bc26:0:b0:2b9:6610:d7ca with SMTP id
 b38-20020a2ebc26000000b002b96610d7camr2960796ljf.5.1691605825099; Wed, 09 Aug
 2023 11:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
 <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
 <20230807150521.GGZNEIMQ9rsyCmkpoA@fat_crate.local>
 <CACO55tvWuSdwdirj7S3Dk-r4NAw8jC8g5RHKFd62WXi43iQP-w@mail.gmail.com>
 <87fs4sfu54.wl-tiwai@suse.de>
 <CACO55tszwFEgt=8xn4auAE7KJVs3ybGG68OzL9HJt19XGVhhHQ@mail.gmail.com>
 <874jl8fngo.wl-tiwai@suse.de>
 <CACO55ts9YWF7nLi3Zs4xKySpdHyUFgf4r566cKx3FwNTCaz0Sg@mail.gmail.com>
 <87wmy4e4uk.wl-tiwai@suse.de>
 <60ef0646-b0ab-b4e0-9eaa-a2c431c5d682@leemhuis.info>
 <CACO55tt=RosBaYPc_wf3NnRC-+prFg2G9E0GEjnV7TSkWjB2HQ@mail.gmail.com>
In-Reply-To: <CACO55tt=RosBaYPc_wf3NnRC-+prFg2G9E0GEjnV7TSkWjB2HQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 9 Aug 2023 20:30:13 +0200
Message-ID: <CACO55ttZUVCVuWpBiTcr1goWWxs2KP1Xxg00X+hYhbpeJzUEFA@mail.gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO
 for HPD, not PMGR AUX interrupts")
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
Cc: Takashi Iwai <tiwai@suse.de>, nouveau@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Borislav Petkov <bp@alien8.de>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 9, 2023 at 8:28=E2=80=AFPM Karol Herbst <kherbst@redhat.com> wr=
ote:
>
> On Wed, Aug 9, 2023 at 4:04=E2=80=AFPM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > On 09.08.23 15:13, Takashi Iwai wrote:
> > >
> > > If this can't be fixed quickly, I suppose it's safer to revert it fro=
m
> > > 6.4.y for now.  6.5 is still being cooked, but 6.4.x is already in
> > > wide deployment, hence the regression has to be addressed quickly.
> >
>
> feel free to send reverts to mainline and add my r-by tage to it and I
> can push those changes up. Sadly those patches fixed another
> use-after-free, but it seems like we have to take another shot unless
> somebody does have time to look into it promptly.
>

uhm and the two patches around that one,
752a281032b2d6f4564be827e082bde6f7d2fd4fand
ea293f823a8805735d9e00124df81a8f448ed1ae

> > Good luck with that. To quote
> > https://docs.kernel.org/process/handling-regressions.html :
> >
> > ```
> > Regarding stable and longterm kernels:
> >
> > [...]
> >
> > * Whenever you want to swiftly resolve a regression that recently also
> > made it into a proper mainline, stable, or longterm release, fix it
> > quickly in mainline; when appropriate thus involve Linus to fast-track
> > the fix (see above). That's because the stable team normally does
> > neither revert nor fix any changes that cause the same problems in main=
line.
> > ```
> >
> > Note the "normally" in there, so there is a chance.
> >
> > Ciao, Thorsten
> >

