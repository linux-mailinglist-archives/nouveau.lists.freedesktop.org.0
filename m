Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2130CFF25B
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 18:39:27 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8445E10E60D;
	Wed,  7 Jan 2026 17:39:26 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B51D144CA4;
	Wed,  7 Jan 2026 17:31:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767807070;
 b=eaZx43jT1WyPPGRbP9VE2q+NWuNUGCd9CYwcamN93XHsIc/vKvRgsxELIMNNW3sbzi+MS
 GZ18WcHmezerdU5/WfrJ1hBLj1xR42pbNSN7EyHCu1nLFoGyxcHaMSUv1qqATUmsmjahyo7
 HAh4TfqGsGVTgqowwXNr8GiG5p6R3yHtu3yyg95bnl9Pr4Dp2ShZ0tGMfZGSRL4OH4LdU/w
 VCn8kUigImljMr0n5E48F57e4LagNyik8EhbRc+dXbhqeJMixY+IYJiVmq2d3KY/DzljCL7
 ekSN2mpLuVZm7w83OKmTV8TkoiUXyIt8QdPJLcFFJb24w2tW4k/faxameG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767807070; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CD7lgNSYoAzLqjXnj6WV3liPCcj6fvibuJkQ1r6c5uA=;
 b=j6g72FghkGtY6Lzzn2AMLUw64TiN7CWFdDZ5qUg4AMT4TVc3J2wIYMmZujeDgOJQdLSeJ
 yU0YJtWdWu4ybQcs91hX8N3YI8Yomk+w0/tNANw9bueNq2jJ3ZuFN89Ag/mTZq60PMiQo9u
 WOOK8c0QVr2GJdyNWViIWWxfH7s4PK8YfWtWsZivrTL/hlrd5E6E7L4n6YW4gPLM8OV+VNi
 dD4k6DxSfEsGH1wZQqKqbZ24iPXioc8+FE812eb/pf/Gd5Un+IomHocPTBxnEvK5kyxJ9Hl
 5MIGVhnXIalYHW6j+jYy4F0YGtR+26L4o46dxsjL3fCYUoLM5CraBAco5wdw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=goodmis.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=goodmis.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0293D44C9E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 17:31:07 +0000 (UTC)
X-Greylist: delayed 464 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jan 2026 17:39:22 UTC
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com
 [216.40.44.12])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9331E10E2B1
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 17:39:22 +0000 (UTC)
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 9F99A16048D;
	Wed,  7 Jan 2026 17:31:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf06.hostedemail.com (Postfix) with ESMTPA id D68202000F;
	Wed,  7 Jan 2026 17:31:32 +0000 (UTC)
Date: Wed, 7 Jan 2026 12:31:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
Message-ID: <20260107123159.7ac61d69@gandalf.local.home>
In-Reply-To: <39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com>
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
	<8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
	<CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
	<39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: D68202000F
X-Stat-Signature: iz1q955ux1j95575p3magymhwn1ocpdi
X-Spam-Status: No, score=1.40
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/BB/wLHRPf79Wd6nZwG8A6By8H7RvT6cw=
X-HE-Tag: 1767807092-95633
X-HE-Meta: 
 U2FsdGVkX1+WGcNYiwZhZJzaeKHl+I/r5SspS9IyQbARG1Ivwm13yowxselsSjVF1Nn2WbQp8NrBzBz4vy2LctgZSMu+a4znAhiCXz0AKC3yNYbhLTTwOnJaBueduDzy6aKIXFkIJ9erK+Id0qWtwl9zlhindJFd+tElJLcugVwqcLZSkOxQUdnrzMasvZ57+vRakddUBF0B0cN1Nfe0SyYF6mXo0doBr8NJK9xzsx1TyLtf1GhygtV/zfBN+WgFlFtWSIr99x34PM4wJjlk/VgfEeIVC4TQhCfZUyw1U1ns1WjO1KOdOobqaavkLIFWGn/0XkhoRmPeYpqxDhevljJEwCmlGEN4oBgzE9vP2ucD7y9Qc3kIskoGh2H4up3D9P3PyRFM/HlGdWWd/tqV6t5RsPfwJtzQO9z3Jyhum0E=
Message-ID-Hash: MVW4RJUN32GYGNEL5P4JHA2MCRSAWZHI
X-Message-ID-Hash: MVW4RJUN32GYGNEL5P4JHA2MCRSAWZHI
X-MailFrom: rostedt@goodmis.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, rust-for-linux <rust-for-linux@vger.kernel.org>,
 nouveau@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Paul E McKenney <paulmck@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 rostedt@google.com, Yury Norov <yury.norov@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MVW4RJUN32GYGNEL5P4JHA2MCRSAWZHI/>
Archived-At: 
 <https://lore.freedesktop.org/20260107123159.7ac61d69@gandalf.local.home/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 7 Jan 2026 12:20:42 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Thank you for the suggestion! Unfortunately, that would hide the company
> attribution too. Or require it to be in brackets along with the name. There
> appears to be resistance to both these. I do feel fortunate to get company time
> to work upstream, so, on this matter, I have to go with the company's
> preferences.;-). There also appears to be significant progress now to resolve
> the email issues which looks promising (thanks Jason, John and everyone for the
> efforts!).

The one issue I have with people using (or being forced to use) their work
email address is that people switch companies all the time. I find it very
annoying when Cc's suddenly get bounced because it is going to the old
company email address. Worse yet when the developer is still involved with
the upstream community and now they are simply not getting email that they
should be.

This is why I prefer the "(company)" in the email name and not the address.
It allows developers to maintain the same email while they move companies.
I did this for Red Hat, VMware and now Google, and all with the same email
address.

Although I may need to switch to my kernel.org address because my
goodmis.org is being blocked by gmail :-p

> 
> Happy New Year! Thanks,

Happy New Year to you Joel!

-- Steve
