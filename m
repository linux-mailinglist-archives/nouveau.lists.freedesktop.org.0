Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C44CC832
	for <lists+nouveau@lfdr.de>; Thu,  3 Mar 2022 22:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FAF10EE38;
	Thu,  3 Mar 2022 21:40:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D1210EE23
 for <nouveau@lists.freedesktop.org>; Thu,  3 Mar 2022 21:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646343631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xtbmEfHUQ1QhBdRYfxa2FFiLrPGe7Eovpy4drHSn/Dk=;
 b=GGa+mJ6ms0yE++7WhMSW5LuFWxnevMx7Q6q/fSKKvoWsg52AbUfzXvjjd5HNI9DynOANbl
 Fw+kSX2JsReLbeGYoQsz3SNk7fqOxzewvl1lu5PEMfD0qZfgh1MOo4CBR/jiwiR9AZCmcb
 Bx6UmC66fxb6N65TYs4ydwbaq489YnA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-ZCrqPIhIP8iNxcPtNhly1w-1; Thu, 03 Mar 2022 16:40:25 -0500
X-MC-Unique: ZCrqPIhIP8iNxcPtNhly1w-1
Received: by mail-qt1-f199.google.com with SMTP id
 t14-20020ac8760e000000b002e049ff9638so1173390qtq.10
 for <nouveau@lists.freedesktop.org>; Thu, 03 Mar 2022 13:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=xtbmEfHUQ1QhBdRYfxa2FFiLrPGe7Eovpy4drHSn/Dk=;
 b=0GPCqaUWFFE3Yt8WqJkMj57GW23xQxlHt2vxYA8M5w0TrqIx5dM8A2NJBtqrlPFa6j
 bosOVI2lKFUMyBfXjEzZI9kAHugcAZ3konJyoDcaH51qKg02rswZbzTp8gpfNoxB5oWD
 Bh9Yk/Pi9DoYzqS4KR5jPwAMEaSEjPX7zLH7jaGA4JH/E5YvyQoOOInmMN5+RRQpAm+z
 1TGycZTzXueOFgijF4GievB1uY/91ONOMWU9sopcjv0goHQlQsUDYdqj7uL8gwM11zex
 SyvXBaolvL9pMY2ww7sKMCQzvQaLZYhRs+E6mrXo/mMW5+cFviHWy4KigzaMuEYx20tm
 HL9Q==
X-Gm-Message-State: AOAM531L98uhVOlex9IcUatUTWWBU5GIkTPfT4xfqxkuTY/TPaSRSk5z
 oIWaZIeCbSstC5eTbMt1gLo24r+ZJ02t6ZhHinSrruXVxZINxhjkQ/nAWXxPvf84LPnDQ3jOYnk
 NbCeQYH0ZkQSG2Lr3Li0NvWr/eg==
X-Received: by 2002:a05:622a:1344:b0:2df:e997:6681 with SMTP id
 w4-20020a05622a134400b002dfe9976681mr23905385qtk.206.1646343624510; 
 Thu, 03 Mar 2022 13:40:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCA+yenE8eTjRZAZCZvGlnVr52EddV1dU7aim5O2e6OJbzh14S7YnLKVi7sNxTU2jKsuO0vg==
X-Received: by 2002:a05:622a:1344:b0:2df:e997:6681 with SMTP id
 w4-20020a05622a134400b002dfe9976681mr23905369qtk.206.1646343624164; 
 Thu, 03 Mar 2022 13:40:24 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 y11-20020ac85f4b000000b002de4b0a015asm2331075qta.5.2022.03.03.13.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:40:23 -0800 (PST)
Message-ID: <80f0071bbfb744921b842c870ac6f2793c4816b6.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Thu, 03 Mar 2022 16:40:21 -0500
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] 2022 X.Org Board of Directors Elections timeline extended,
 Request for nominations
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
Cc: board@foundation.x.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We are seeking nominations for candidates for election to the X.org Foundation
Board of Directors. However, as we presently do not have enough nominations to
start the election - the decision has been made to extend the timeline by 2
weeks. Note this is a fairly regular part of the elections process.

The new deadline for nominations to the X.org Board of Directors is 23:59 UTC
on 20th March 2022.

The Board consists of directors elected from the membership.  Each year, an
election is held to bring the total number of directors to eight. The four
members receiving the highest vote totals will serve as directors for two year
terms.

The directors who received two year terms starting in 2021 were Lyude Paul,
Samuel Iglesias Gonsálvez, Manasi D Navare and Daniel Vetter. They will
continue to serve until their term ends in 2023. Current directors whose term
expires in 2022 are Emma Anholt, Keith Packard, Harry Wentland and Mark
Filion.

A director is expected to participate in the fortnightly IRC meeting to
discuss current business and to attend the annual meeting of the X.Org
Foundation, which will be held at a location determined in advance by the
Board of Directors.

A member may nominate themselves or any other member they feel is qualified.
Nominations should be sent to the Election Committee at elections at x.org.

Nominees shall be required to be current members of the X.Org Foundation, and
submit a personal statement of up to 200 words that will be provided to
prospective voters.  The collected statements, along with the statement of
contribution to the X.Org Foundation in the member's account page on
http://members.x.org, will be made available to all voters to help them make
their voting decisions.

Nominations, membership applications or renewals and completed personal
statements must be received no later than 23:59 UTC on 20th March 2022.

The slate of candidates will be published 28th March 2022 and candidate Q&A
will begin then. The deadline for Xorg membership applications and renewals is
31st March 2022.

Cheers,
   Lyude Paul, on behalf of the X.Org BoD

