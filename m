Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF0EC95A
	for <lists+nouveau@lfdr.de>; Fri,  1 Nov 2019 21:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5616F85B;
	Fri,  1 Nov 2019 20:06:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE166E301
 for <nouveau@lists.freedesktop.org>; Fri,  1 Nov 2019 20:06:48 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-bXrx_3UeOGaj75h3NFAhhQ-1; Fri, 01 Nov 2019 16:06:44 -0400
Received: by mail-qk1-f197.google.com with SMTP id a186so8078994qkb.18
 for <nouveau@lists.freedesktop.org>; Fri, 01 Nov 2019 13:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=T0uidzvnSOYOIyqMlnQPdQRM6HckHVeBK/+Gw1LVgoc=;
 b=KAMtVNdnG3ybbiql0LfTZOinK1psXqlN03oiC1e+OvKaypGfmQUYwIsbSylMtKUWn1
 XK5XhJ4tYfuDpV9YbLY+hsDBbVJtw+0MwtCz0mcb7+s9k1LWxQ5y3enX+O0Q0useLMF6
 mnUtkmilPyN4pTEChQr+R8sg9Gpj5aVNygWQv3MunEEW7vYO/BQPCEdg0wCFwb62uBOI
 IzLyL2GnWbLFHHfybX5lwFtw6QCL6iSr/p5N5S8XY3WTPglrsHvUbyhcbANtaUmCN2Aw
 F437JvuWREh2d1zMhQM8MN6IPy7W09kMZLZ3LtX1OdcLJb8uixB1dZnglF7ti2EdK9XU
 LMtA==
X-Gm-Message-State: APjAAAXm/qv2KW19yWYmIwBW/eSFE8SnF6bnmuB+m0uLCnnSx/kdr+SH
 g9YSSnS43EQcIATKj9/u/GXB+FAldX3LPFFWeCDJhHOossuqfKJDtr44au8s4MbtZAHo5Stm4kt
 9T6DfFqjHCCHzwGVmxOX3NXnKsA==
X-Received: by 2002:ac8:6a04:: with SMTP id t4mr1203930qtr.37.1572638804197;
 Fri, 01 Nov 2019 13:06:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNSOfgqDMYNbamEmlFYFB8GSv+3Bq/jbE8/WSmF2D5uk3m9IYE7IszplOMqJoINO5ly82u0A==
X-Received: by 2002:ac8:6a04:: with SMTP id t4mr1203915qtr.37.1572638804015;
 Fri, 01 Nov 2019 13:06:44 -0700 (PDT)
Received: from dhcp-10-20-1-46.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id c204sm4092436qkb.90.2019.11.01.13.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 13:06:42 -0700 (PDT)
Message-ID: <91aa24ed23e2b8c012ec43ef9eb5baed2532f96c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: "members@x.org" <members@x.org>, xorg-devel@lists.x.org, dri-devel
 <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>
Date: Fri, 01 Nov 2019 16:06:40 -0400
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: bXrx_3UeOGaj75h3NFAhhQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572638808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xRjJf6mDuz5grOqzevKLN/DK88NMiYZAX/hKIofKo8s=;
 b=I6yJI+ZI5mbYBNptKO0ShO0D6qqD3YED8iTuymJBn86T6EQ+erEZxQ9nQMOqsA/K8unNhJ
 ljnHxgmfmVpmDTZzo46KWIqIGYTCA5QDz5zB+e6y1QwIRvgLp4tYkhABMK/zJK+mTWHPah
 3MiKpECw7Js8KfgEg3sRsi5wviHwdVA=
Subject: [Nouveau] Individuals interested in VESA memberships?
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: "X.Org Foundation Board" <board@foundation.x.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkhIFJlY2VudGx5IEkndmUgYmVlbiB3b3JraW5nIHdpdGggdGhlIHJlc3Qgb2YgdGhlIFguT3Jn
IGJvYXJkIHRvIHRyeSB0byBnZXQKWC5vcmcgYWNjZXNzIHRvIFZFU0EgbWVtYmVyc2hpcHMgc28g
dGhhdCBjb250cmlidXRvcnMgdGhhdCBkb24ndCBoYXZlIGFuCmVtcGxveWVyIHdobyBpcyBhYmxl
L3dpbGxpbmcgdG8gam9pbiBWRVNBIGNhbiBwb3RlbnRpYWxseSBnZXQgYWNjZXNzIHRvIHRoZQp2
YXJpb3VzIGJlbmVmaXRzIG9mIGEgVkVTQSBtZW1iZXJzaGlwLCBzdWNoIGFzIGFjY2VzcyB0byBE
aXNwbGF5UG9ydApzcGVjaWZpY2F0aW9ucy4gU2luY2UgSSBuZWVkIHRvIGdhdGhlciBhIGxpc3Qg
b2YgaW50ZXJlc3RlZCBYLm9yZyBtZW1iZXJzLCBJJ2QKbGlrZSB0byBrbm93IHdobyBhbGwgbWln
aHQgYmUgaW50ZXJlc3RlZCBpbiBhIG1lbWJlcnNoaXAgbGlrZSB0aGlzLiBUaGVyZSBhcmUKbm8g
Y29zdHMgaW52b2x2ZWQsIGFzIHRoZSBWRVNBIG1lbWJlcnNoaXAgd2UncmUgbG9va2luZyBhdCBp
biBwYXJ0aWN1bGFyIGNvbWVzCmF0IG5vIGNvc3QgdG8gdXMgc2luY2Ugd2UncmUgYSBub24tcHJv
Zml0LgoKVGhlIGN1cnJlbnQgcGxhbiBpcyB0byBleHRlbmQgVkVTQSBtZW1iZXJzaGlwIHRvIFgu
T3JnIG1lbWJlcnMgd2hvCnNwZWNpZmljYWxseSByZXF1ZXN0IGl0LiBJZiB5b3UgdGhpbmsgeW91
J2QgYmUgYXQgYWxsIGludGVyZXN0ZWQgaW4gdGhpcywgb3IKa25vdyBhbnkgcHJvamVjdHMgb3Ig
Y29udHJpYnV0b3JzIHdobyB3b3VsZCBiZSwgcGxlYXNlIGZlZWwgZnJlZSB0byByZXNwb25kIHRv
CnRoaXMgbWVzc2FnZSBhbmQgbGV0IG1lIGtub3chCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
