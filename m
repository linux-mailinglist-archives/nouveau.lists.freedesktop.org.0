Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C065933
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2019 16:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6F86E25D;
	Thu, 11 Jul 2019 14:42:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107E76E24E
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 14:18:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j8so2415013wrj.9
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 07:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sAzcovVRXPCeaR2nSfCBiJKzt4ll6AfkNLc/XcAygHs=;
 b=Q5scJgb4T4fb1sWQ3bSX3UEHrtSx5JetzbqWweWHvTantTJzJHoqUm+i1LWOC55GoM
 MyP0iz4eoadOwomJ70BYJTdyPkUvW6dJC3rENeuNpoqxUgNJkQdx17kZCKMoyVdefwoO
 fDnndI/t5QQzb84lYjPCinuqg2PJAXBxiLQ/vozpuQu9NQM8Vh/n/w2r21/onaqQoSX5
 gM5tKcHOZE4gT4b07AOKgYG+DPw9RiNgQpjsBP7hsZnkyY/jl4+upfSryZzn2BwG+po2
 +vYlAOmF61oMlLKuTwh9uhutD3KxAnwjEfpkqsDMw1dgPZhr6CPrC1SrP8W65pLeO8v4
 FcKw==
X-Gm-Message-State: APjAAAViAN+2pX1XbWBk/sChXd8WfTGITqwJBh+0NjXed8sO5iWtk3SO
 93o8h3XprI7jF2JKrXg35wGLbU+ikP0=
X-Google-Smtp-Source: APXvYqy41aDDY9BonBFsucX29jvO1oq4lf1RoVl8jfeJAEOwP7/2KAKkyTTz+i1JN9M8x/NEN1Oa4Q==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr5448129wrq.333.1562854695577; 
 Thu, 11 Jul 2019 07:18:15 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id 5sm5883635wmg.42.2019.07.11.07.18.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 07:18:15 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 11 Jul 2019 16:11:49 +0200
Message-Id: <20190711141153.7723-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 11 Jul 2019 14:42:17 +0000
Subject: [Nouveau] [PATCH 0/4] Refuse to load if the power cable are not
 connected
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

dHJlbGxvIGNhcmQ6Cmh0dHBzOi8vdHJlbGxvLmNvbS9jL2FkbXpEUnZkLzUwLXJlZHVjZS1wZXJm
b3JtYW5jZS1yZWZ1c2UtdG8tYm9vdC1pZi1ub3QtYWxsLXRoZS1wb3dlci1jb25uZWN0b3JzLWFy
ZS1wbHVnZ2VkCgpNYXJrIE1lbnp5bnNraSAoNCk6CiAgbW92ZWQgZ3BpbyBzbyBpdCBpcyBzb3J0
ZWQgYnkgdmFsdWVzCiAgZ3BpbzogY2hlY2tpbmcgaWYgZ3B1IHBvd2VyIGNhYmxlIGlzIGNvbm5l
Y3RlZAogIGdwaW86IGFkZGVkIHBvd2VyIGNoZWNrIGZvciBhbm90aGVyIEdQSU8KICBncGlvOiBh
ZGRlZCBwb3dlciBjaGVjayBmb3IgYW5vdGhlciBHUElPCgogZHJtL25vdXZlYXUvaW5jbHVkZS9u
dmttL3N1YmRldi9iaW9zL2dwaW8uaCB8ICA1ICsrKystCiBkcm0vbm91dmVhdS9udmttL3N1YmRl
di9ncGlvL2Jhc2UuYyAgICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFp
bGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
