Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198366C6CB
	for <lists+nouveau@lfdr.de>; Mon, 16 Jan 2023 17:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6CA10E45B;
	Mon, 16 Jan 2023 16:25:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4866710E45B
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jan 2023 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673886301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SapRDhSD4bg3SNicTSW2wGgbS66LIJZoHqZZ/9cufV4=;
 b=KKec3WhzPW49Hf4c0lgI1FRD59s0ltp1jZD5Yma+1MwitgrYXw0tyZPhSThkpO6AHUUO4v
 OYHEynqate4/Ir6Jo0Oi4hL3BoIw4aiXylOydVFyoQRLwAb159N6mDYGCmhqIGiDvDtLrq
 Uxt37DiTFFr5SFf1rS0ymavoWvHpDfk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-KMg4HIE4OGWR3ZlO10epJw-1; Mon, 16 Jan 2023 11:25:00 -0500
X-MC-Unique: KMg4HIE4OGWR3ZlO10epJw-1
Received: by mail-lj1-f199.google.com with SMTP id
 y19-20020a05651c221300b00279958f353fso7520435ljq.1
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jan 2023 08:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SapRDhSD4bg3SNicTSW2wGgbS66LIJZoHqZZ/9cufV4=;
 b=l0DTeF6wH+zwn1fm3WmLX21yrUtVz5nn0nD5U/57MQB1mqu8c3N7JDti/qmPKzNCvq
 1Sg3hvx8J6+KVHHZVCBqbYuWfmztaORnAeqb9SbIPXYF/1kOj0/swMdob1af0VPBjJnR
 Ul77AvkdHG2E1h7q/uI/jUK5mL7rrpiCLez/fUY7Ixbzv5afx7ByuK/C0CSsJiyDSEZR
 d8pNU5FqIDxbNuV5k16zgE39odzMDonGBIQO3rA63QCUo+InCoIcS4+pKJjjUYzHF7Yt
 qzdBk3VbokvkYKlhzH79FNVa6LNaLgWNEX8fT7lSLULC24e4nlXMJDBNPU+oltU92aAl
 il8w==
X-Gm-Message-State: AFqh2krBUVCer2wUtDVoEvSrY4ZLrZDQ4ki5/ZHL8f8yG80805mKrPBs
 LVU49QEaHZLsK/lEYdRufEt9CpHbai7KbVL71tNuV8tCaDCgZfcfBXYsOFW0Am8avWlL34+8ek6
 YEQSJ8Cou8iVIyjshY/C4Yz790Jtw7REecj2vSLbXsQ==
X-Received: by 2002:ac2:4f8c:0:b0:4d0:7b7:65dc with SMTP id
 z12-20020ac24f8c000000b004d007b765dcmr483288lfs.122.1673886298943; 
 Mon, 16 Jan 2023 08:24:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXskVXALh3cMxytws6o+ulKkC0aRueGIcJS8YRlvP7WpfCxojGKp4y72qPmz5veoTJzcgsV96C0ycbrb/7Q/f08=
X-Received: by 2002:ac2:4f8c:0:b0:4d0:7b7:65dc with SMTP id
 z12-20020ac24f8c000000b004d007b765dcmr483278lfs.122.1673886298656; Mon, 16
 Jan 2023 08:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20230103234835.never.378-kees@kernel.org> <Y7TNtQqunHIW8her@work>
In-Reply-To: <Y7TNtQqunHIW8her@work>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 16 Jan 2023 17:24:47 +0100
Message-ID: <CACO55tsyCtf-_mCPVEo-4Dj_mAu-tnNTTjP75wx=9n+TS1XVvw@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [RESEND][PATCH] drm/nouveau/fb/ga102: Replace
 zero-length array of trailing structs with flex-array
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 4, 2023 at 1:52 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Tue, Jan 03, 2023 at 03:48:36PM -0800, Kees Cook wrote:
> > Zero-length arrays are deprecated[1] and are being replaced with
> > flexible array members in support of the ongoing efforts to tighten the
> > FORTIFY_SOURCE routines on memcpy(), correctly instrument array indexing
> > with UBSAN_BOUNDS, and to globally enable -fstrict-flex-arrays=3.
> >
> > Replace zero-length array with flexible-array member.
> >
> > This results in no differences in binary output.
> >
> > [1] https://github.com/KSPP/linux/issues/78
> >
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: nouveau@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Here is my RB again:
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push in a moment

> Thanks!
> --
> Gustavo
>
> > ---
> > Sent before as: https://lore.kernel.org/all/20221118211207.never.039-kees@kernel.org/
> > ---
> >  drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > index 8c4cd08a7b5f..8b58b668fc0c 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > @@ -52,7 +52,7 @@ struct nvfw_hs_load_header_v2 {
> >       struct {
> >               u32 offset;
> >               u32 size;
> > -     } app[0];
> > +     } app[];
> >  };
> >
> >  const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvkm_subdev *, const void *);
> > --
> > 2.34.1
> >
>

