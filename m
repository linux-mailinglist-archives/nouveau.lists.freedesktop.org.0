Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD08510733
	for <lists+nouveau@lfdr.de>; Tue, 26 Apr 2022 20:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A62610E4E6;
	Tue, 26 Apr 2022 18:36:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538E010E40B
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650998208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U7x3WHti8mB7zSssr6dU5T2fFBWQH7ax9JH4iLf8LkU=;
 b=d9odd6x1wzf73HOPYL+LjGvCy5TRQTwMNFXtI7TiJWkb2z+0740XtXKsww5enbon1NOxeF
 BeG1IYDTzNhyXmzTw+t6NMKFraaMmw1xYNzzvnOVQgpTc3twvCLZqelVa6nWwYVLUI0dgS
 Jw9Uy9J+ihQ3S93rr9oF7tHVSIqJsL4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-YO4yS2hvODyRlTe-bVHivQ-1; Tue, 26 Apr 2022 14:36:47 -0400
X-MC-Unique: YO4yS2hvODyRlTe-bVHivQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 p207-20020a3742d8000000b0069e80ba4a17so12307789qka.4
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 11:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=U7x3WHti8mB7zSssr6dU5T2fFBWQH7ax9JH4iLf8LkU=;
 b=xXcdp9HppFyaCiHHDQHUw4sepwcR4GCG0SbOYr+NpiT8lw5HXRNORPus8blyJKfQoX
 Y9b5vBoA+Xy499WQ1uI5TzPjL54sMGVPvr9Jq2+WAq1sLn+jh+rkQ7DZl6RXUDeou5wp
 WvnWkHhITe7GLWKelYigdh2FgmtxzKGNpkDybaXnWsA8SE2lO5ygdB0FKuXWdQCjNRpf
 0BrU0EKA1WYicYY7zpN5PgaBQaTp/Nq1iNJaWS5TKchjqRxPu2kIpOFNVZdt+hsxGh8c
 rbqPsBjDSCh4TwR+4Y5MtgCAWpGBlJeMq4tx6E56ybogPxQSpXxsHw/EAetydfsRNgua
 4MVQ==
X-Gm-Message-State: AOAM5318OEVV5luMegJfaMznUCzn9TG5HdqXia9p1cNYkfeIB3re69tf
 m8d2GNrVTqGTXIqqCj6LX3ne5YBOrDaN4YmTp+UKUTLuQ4zWOvsFSMlfZ5tE63euA9y3aiH+Mrn
 UgW5cHaw28M9K9wcwQpdEi8tTgA==
X-Received: by 2002:a05:620a:f98:b0:648:a980:5161 with SMTP id
 b24-20020a05620a0f9800b00648a9805161mr13975225qkn.545.1650998206525; 
 Tue, 26 Apr 2022 11:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFlkV78mcoPFbdNEywIl8YhmnRu/TNzHWCRjxstF0LNzVzvVzweFee+/7HtJv0KoRQlwNbkA==
X-Received: by 2002:a05:620a:f98:b0:648:a980:5161 with SMTP id
 b24-20020a05620a0f9800b00648a9805161mr13975211qkn.545.1650998206290; 
 Tue, 26 Apr 2022 11:36:46 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 f39-20020a05622a1a2700b002f367d7a7a5sm4252542qtb.23.2022.04.26.11.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:36:45 -0700 (PDT)
Message-ID: <2be5f25b4212817ebc5e0435467848675063b45f.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: "events@lists.x.org" <events@lists.x.org>, 
 "xorg-devel@lists.freedesktop.org"
 <xorg-devel@lists.freedesktop.org>, wayland-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, libre-soc-dev@lists.libre-soc.org
Date: Tue, 26 Apr 2022 14:36:44 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] Requests For Proposals for hosting XDC 2023 are now open
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

Hello everyone!

The X.org board is soliciting proposals to host XDC in 2023. Since
XDC 2022 is being held in North America this year, XDC 2023 is expected
to be in Europe. However, the board is open to other locations,
especially if there's an interesting co-location with another
conference.

If you're considering hosting XDC, we've assembled a wiki page with
what's generally expected and needed:

https://www.x.org/wiki/Events/RFP/

When submitting your proposal, please make sure to include at least the
key information about the potential location in question, possible
dates along with estimated costs. Proposals can be submitted to board
at foundation.x.org until the deadline of *September 1st, 2022*. 

Additionally, an quirk early heads-up to the board if you're
considering hosting would be appreciated, in case we need to adjust the
schedule a bit. Also, earlier is better since there generally will be a
bit of Q&A with organizers.

And if you just have some questions about what organizing XDC entails,
please feel free to chat with previous organizers, or someone from the
board.

Best regards,
	Lyude Paul
On behalf of X.org

