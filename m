Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59EA5907F5
	for <lists+nouveau@lfdr.de>; Thu, 11 Aug 2022 23:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93A110E93B;
	Thu, 11 Aug 2022 21:20:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E96118A9CE
 for <nouveau@lists.freedesktop.org>; Thu, 11 Aug 2022 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660252795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfN77bhoCRCTa2aQqrRUHWuFxk2bq6MxLsoTkjmhbrM=;
 b=PXFjyuoRUYi24ixral0DXCI85wVZDO7RTPPgs7wVXVb56V17KS3UBI3UllwJa/ftd2AcY6
 u697Gycb2EvEUE+nMifG6I3KHYyXiJXKCHhg2YymEuYYqWzrbUTbLyCfEeKs8dAfX4sB4b
 NuGwRuqzhzdNEwHTuZ4ZrRVsGThkCuc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-UEYDFQK3MV-5DPecgtJSBg-1; Thu, 11 Aug 2022 17:19:54 -0400
X-MC-Unique: UEYDFQK3MV-5DPecgtJSBg-1
Received: by mail-qt1-f200.google.com with SMTP id
 g22-20020ac85816000000b00342b02072ceso13301513qtg.0
 for <nouveau@lists.freedesktop.org>; Thu, 11 Aug 2022 14:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=DfN77bhoCRCTa2aQqrRUHWuFxk2bq6MxLsoTkjmhbrM=;
 b=1GVRJpg51CMiDMB8gq2C8dlZbyK+k06pugZY3s3hZssq5EhzIPSSkKx1dFb89KaOXj
 xMfgAG567E46yBdExnPTrJB39XJfYyVRfGjB4Tm2c9RTPEvNjwbK3AF9hkrSfqtFM0+L
 XrmbSDJHaxKFyWNBlFhXrfLpdzfcVBX4x80Fd+9oc1fSUIWUUCT1sG5xw3uQG0Ub64CF
 VddHIh0ijWU/cLeHNMccOy0YLTHkbYySdLET6IXDdCMTYz7kVKy1Eiavw+qX7fccWglo
 0OfZXR8E3+7UJqZuOlq529mRA7kVMrfGzaM1QL/j9fyxz/HSs8s8/GnvXt5CxV1l70gw
 dbkQ==
X-Gm-Message-State: ACgBeo2Yz7hg+jgTt21Y89qC67IrmC6PJTbwCnsax1CLygdrw/bO01zB
 ZuwUi7vgYj+SsvnfLz7v61+gNznVtzrnoUBFXAF3WUs984eQ6lWb7WfNQpU4q5yE9+JbcGzyVLN
 x5/jXhzF35NT5U1qsxtKf+Pv4tw==
X-Received: by 2002:a05:620a:c0c:b0:6ba:164c:c9d6 with SMTP id
 l12-20020a05620a0c0c00b006ba164cc9d6mr773634qki.118.1660252793506; 
 Thu, 11 Aug 2022 14:19:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5f/nuq+XlC+ztrAymnhoT7+1An9wpcFjhXfRuEd0B/d97mrMDf23WAqsAhK3zVyoxD3akxzg==
X-Received: by 2002:a05:620a:c0c:b0:6ba:164c:c9d6 with SMTP id
 l12-20020a05620a0c0c00b006ba164cc9d6mr773627qki.118.1660252793313; 
 Thu, 11 Aug 2022 14:19:53 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 c3-20020a05620a268300b006b58d8f6181sm298397qkp.72.2022.08.11.14.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 14:19:52 -0700 (PDT)
Message-ID: <31a134642314b288771637610659a4f50f971f27.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Date: Thu, 11 Aug 2022 17:19:51 -0400
In-Reply-To: <CACO55ttafiSS+eU=g0=uqwvU7yi+B_6LJK1VJ2FLObn6Rg8LYQ@mail.gmail.com>
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
 <YWhgFZPqx3qKqr0C@debian.fritz.box>
 <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
 <2296778.YFyOdMMpyM@debian>
 <CAHSpYy1HJzY5kNoxk36yGRsKhmxQYP7FVM=Orn7RyKCtZc293w@mail.gmail.com>
 <CACO55tsJCPLw+UH6ADyHy62CfQKTtAwskoP86as2pwKnO7-NwQ@mail.gmail.com>
 <071b71819660d61d9b5caa368f683189a192754f.camel@redhat.com>
 <CACO55ttafiSS+eU=g0=uqwvU7yi+B_6LJK1VJ2FLObn6Rg8LYQ@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] Advice about debugging nouveau driver suspend issue
 (init_on_alloc=1 and init_on_free=1)
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
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 2022-08-11 at 00:08 +0200, Karol Herbst wrote:
> the thing is, without this patch, the "hw path" fails with a timeout
> of... 30 seconds?, the code falls back to sw and it takes up to 2-3
> minutes to finish up. So even if this solution is overkill, it fixes a
> real issue. I suspect _something_ is bonkers with the fencing we do
> here and we don't see that the stuff is actually finished or whatever,
> or maybe we never emit the fence in the first place.. I didn't dig
> deep enough.
> 
> With this, it's really quick and everything.

I guess with a todo comment this is probably fine then, since this would only
really be affecting GPUs using m2mf anyway

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

