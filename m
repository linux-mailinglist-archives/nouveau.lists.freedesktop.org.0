Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA20C3F01E1
	for <lists+nouveau@lfdr.de>; Wed, 18 Aug 2021 12:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E108789182;
	Wed, 18 Aug 2021 10:38:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909C289182
 for <nouveau@lists.freedesktop.org>; Wed, 18 Aug 2021 10:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629283095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ltl0AK46FjmSHMdF3JnqbCOPSiE1x1FZolZonYtEoeY=;
 b=DvpSpOnxsoZgVHsyk9Zzz6YczY3nx+ztRQ1K+ri+mtJDD47+gOlclYYLDR6AnAoNP6WsWM
 Y4q3l+k1gBgZCesmjDLdRev27lH6+FvR2J4TGCLJR0+FKg7JVeOJiWDMLpB2mBN2iMbsLZ
 69A1UsKyjWhxbVwr2v72ZTcO3z2hyw4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-KmZeMQZvOa2G-GsCqL1iKQ-1; Wed, 18 Aug 2021 06:38:13 -0400
X-MC-Unique: KmZeMQZvOa2G-GsCqL1iKQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 x18-20020a5d49120000b0290154e9dcf3dbso450268wrq.7
 for <nouveau@lists.freedesktop.org>; Wed, 18 Aug 2021 03:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ltl0AK46FjmSHMdF3JnqbCOPSiE1x1FZolZonYtEoeY=;
 b=dz2O7WcbhDp2ZBrM0AR+zBFgfbhWLriL3waQQIzSq1iKFTE59Ffj0jCgBjXhXyGpj5
 uGNKCJPCswRUV0Jg6vBne7Uxf+/6WChdscyq9wsssdLXqVytmGUXQWq6T3a/6ehrmNVd
 cRDKlzPxiXxN7HzZ+U79j4B+yd1zx2G5xfPnS9vA4VaVeee2WV1NiZdZzHKZ9kc1eS+I
 wKH8BQjxeHdiTSCTax0ApDuqPY3ak5yhSZ9/zgqIYl3CceEPD2hz7InMRtmLQWb/6Dnz
 +rbySHt+ayPvrRPKFHlAYHHbAi8f5TJugd8Ow6KwOyxMdUGpD/7CqE6Zneo7l7VU92P8
 VB8g==
X-Gm-Message-State: AOAM5320iPz19cOBznFHyxS2z6GmqRDTxPyvPFHDv2fYPhYnfWZ+xhfT
 IFHotEIKXP6n2o0bNZANUrhklUoMZ2txxlFtR953whujhW3aa2/NcJQ9HkJdLmvOjit2+JpmLzL
 aaqkgtNH9+CQxsAolKbzk9HoWXTMdTxqQcwD3xK8zeg==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr7903142wmb.171.1629283092166; 
 Wed, 18 Aug 2021 03:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw6/wFH+sMeZ3ii/uoOLA2AemBw1DQPT6WgURIDLbaJeb83UYEHh80oCBF7iHtqMicep+ACJmSnqb/NnZblx4=
X-Received: by 2002:a1c:7316:: with SMTP id d22mr7903124wmb.171.1629283091939; 
 Wed, 18 Aug 2021 03:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.20.2108131619500.25540@maria.rogerprice.org>
In-Reply-To: <alpine.DEB.2.20.2108131619500.25540@maria.rogerprice.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 18 Aug 2021 12:38:01 +0200
Message-ID: <CACO55tu-GMU+Oo3VHM50=bjsxq8ZAWbDXfMg=4+KnDib2i28Aw@mail.gmail.com>
To: Roger Price <roger@rogerprice.org>
Cc: nouveau Mailing List <nouveau@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Donate NVC0 GF 100 GL [Quadro 4000]
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

Hey, thanks for the offer. In which country are you located?

On Fri, Aug 13, 2021 at 4:44 PM Roger Price <roger@rogerprice.org> wrote:
>
> I have an NVC0 GF 100 GL [Quadro 4000] I would be happy to donate if anyone is
> interested.  I'm in France.  I'll pay the postage.
>
> Nouveau as included in Debian 11 freezes after 10-100 minutes with this card.
>
> If anyone is interested in this card, I'll file a full bug report via Debian
> as described at https://nouveau.freedesktop.org/Bugs.html
>
> Roger
>

